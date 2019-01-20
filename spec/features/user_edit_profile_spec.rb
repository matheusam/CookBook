require 'rails_helper'
feature 'User edit profile' do
  scenario 'Personal data',login:true do
    visit root_path
    click_on 'Meu perfil'
    click_on 'Editar perfil'
    fill_in 'Nome', with: 'Lincon'
    fill_in 'Cidade', with: 'New York'
    fill_in 'Facebook', with: 'fb.com/linconficial'
    fill_in 'Twitter', with: 'twitter.com/linconficial'
    click_on 'Atualizar perfil'

    expect(page).to have_css('h3', text:'Nome')
    expect(page).to have_css('p', text:'Lincon')
    expect(page).to have_css('h3', text:'Cidade')
    expect(page).to have_css('p', text:'New York')
    expect(page).to have_css('h3', text:'Facebook')
    expect(page).to have_css('p', text:'fb.com/linconficial')
    expect(page).to have_css('h3', text:'Twitter')
    expect(page).to have_css('p', text:'twitter.com/linconficial')

  end

  scenario 'Access data',login:true do
    visit root_path
    click_on 'Meu perfil'
    click_on 'Editar perfil'
    click_on 'Informações de acesso'
    fill_in 'Email', with: 'lincon@senador.com'
    fill_in 'Senha atual', with: 'rspec@test'
    fill_in 'Senha', with: 'lincon'
    fill_in 'Confirme sua senha', with: 'lincon'
    click_on 'Atualizar perfil'
    visit root_path

    expect(page).to have_content('Bem vindo, lincon@senador.com')
    expect(current_path).to eq root_path
  end
end
