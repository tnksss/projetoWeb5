require 'rails_helper'

describe "Users:Sessions", type: :feature do
  it "displays the user's perfil links after successful login" do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
      click_button 'Entrar'
      expect(page.current_path).to eq root_path
      expect(page).to have_selector('a', text: 'Meu perfil')
      expect(page).to have_selector('div.alert.alert-info',
                                    text: 'Logado com sucesso.')
  end
  it "displays the user's error message when user or password is wrong" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'passworda'
    click_button 'Entrar'
    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_selector('div.alert.alert-warning',
                                  text: 'Email ou senha inválida.')
  end
    
  it 'displays success logout message when the user click on logout' do
     user = FactoryGirl.create(:user)
     login_as(user, scope: :user)
     visit root_url
     expect(page).to have_selector('a', text: 'Meu perfil')
     expect(page).to have_selector('a', text: 'Sair')
     click_link('Sair')
     expect(page.current_path).to eq root_path
     expect(page).to have_selector('div.alert.alert-info',
      text: 'Saiu com sucesso.')
 end

 context "Register a user" do
    it 'should register a user with success when the data are valid' do
      user = FactoryGirl.build(:user)
      visit new_user_registration_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      expect do
        find('input[name="commit"]').click
      end.to change(User, :count).by(1)
      expect(page.current_path).to eq root_path
      expect(page).to have_selector('div.alert.alert-info',
                                    text: 'Bem-vindo! Você se registrou com êxito.')
    end

    it 'should not register a user with invalid date, and must show a error message' do
      visit new_user_registration_path
      fill_in 'user_email', with: 'email'
      fill_in 'user_password', with: 'abc123'
      fill_in 'user_password_confirmation', with: '12314'
      expect do
        find('input[name="commit"]').click
      end.to change(User, :count).by(0)

      expect(page).to have_selector('div.alert.alert-danger',
                                    text: 'Alguns erros foram encontrados, por favor verifique:')

      within('div.user_email') do
        expect(page).to have_content('não é válido')
      end

      within('div.user_password') do
        expect(page).to have_content('6 caracteres no mínimo')
      end

      within('div.user_password_confirmation') do
        expect(page).to have_content('não é igual a Senha')
      end
    end
  end

end
