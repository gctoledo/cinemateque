require 'rails_helper'

describe 'User visits section creation page' do
  it 'and creates section with success' do
    user = FactoryBot.create(:user, email: 'john@doe.com', password: '123456789')
    movie_theater = FactoryBot.create(:movie_theater, name: 'Cine Paradiso')
    movie = FactoryBot.create(:movie, title: 'Jurassic Park', year: 1993, director: 'Steven Spielberg', plot: 'Os paleontólogos Alan Grant, Ellie Sattler e o matemático Ian Malcolm fazem parte de um seleto grupo escolhido para visitar uma ilha habitada por dinossauros criados a partir de DNA pré-histórico. O idealizador do projeto e bilionário John Hammond garante a todos que a instalação é completamente segura. Mas após uma queda de energia, os visitantes descobrem, aos poucos, que vários predadores ferozes estão soltos e à caça.')
    room = FactoryBot.create(:room, name: 'Sala 01', capacity: 100, movie_theater: movie_theater)
    login_as user

    visit root_path
    within('nav') do
      click_on 'Sessões'
    end
    click_on 'Adicionar sessão'
    select 'Jurassic Park', from: 'section-movie'
    select 'Sala 01', from: 'section-room'
    select 'Segunda-feira', from: 'section-day'
    fill_in 'Horário', with: '18:00'
    click_on 'Criar sessão'

    expect(page).to have_content 'Sala 01'
    expect(page).to have_content 'Segunda-feira'
    expect(page).to have_content '18:00'
    expect(page).to have_content 'Jurassic Park'
    expect(page).to have_content 'Sessão adicionada com sucesso.'
  end

  it 'and cant create section because fields are mandatory' do
    user = FactoryBot.create(:user, email: 'john@doe.com', password: '123456789')
    movie_theater = FactoryBot.create(:movie_theater, name: 'Cine Paradiso')
    movie = FactoryBot.create(:movie, title: 'Jurassic Park', year: 1993, director: 'Steven Spielberg', plot: 'Os paleontólogos Alan Grant, Ellie Sattler e o matemático Ian Malcolm fazem parte de um seleto grupo escolhido para visitar uma ilha habitada por dinossauros criados a partir de DNA pré-histórico. O idealizador do projeto e bilionário John Hammond garante a todos que a instalação é completamente segura. Mas após uma queda de energia, os visitantes descobrem, aos poucos, que vários predadores ferozes estão soltos e à caça.')
    room = FactoryBot.create(:room, name: 'Sala 01', capacity: 100, movie_theater: movie_theater)
    login_as user

    visit root_path
    within('nav') do
      click_on 'Sessões'
    end
    click_on 'Adicionar sessão'
    click_on 'Criar sessão'

    expect(page).to have_content 'Sessão não foi adicionada.'
  end
end