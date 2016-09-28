namespace :dev do
  desc 'Creates sample data for local development'
  task prime: ['db:setup'] do
    unless Rails.env.development?
      raise 'This task can only be run in the development environment'
    end

    require 'factory_girl_rails'

    create_places
    create_searches
  end

  private

  def create_places
    header 'places'

    create(:place,
           :active,
           kind: 'company',
           name: 'Craftsmen',
           street: '25 rue Lenepveu',
           zip_code: '49000',
           city: 'Angers',
           latitude: 47.472041,
           longitude: -0.551269,
           url: 'http://craftsmen.io',
           description: '',
           twitter_name: 'craftsmenhq',
           logo_url: 'https://pbs.twimg.com/profile_images/425256684244566016/N0wcdLyQ_400x400.jpeg')
    create(:place,
           :active,
           kind: 'company',
           name: 'Playmoweb',
           street: '25 rue Lenepveu',
           zip_code: '49000',
           city: 'Angers',
           latitude: 47.472041,
           longitude: -0.551269,
           url: 'http://playmoweb.com',
           twitter_name: 'playmoweb',
           description: 'Applications mobiles',
           logo_url: 'https://pbs.twimg.com/profile_images/572349272830402560/MojlFbrG.png')
    create(:place,
           :active,
           kind: 'nonprofit',
           name: 'Mainelabs',
           street: '12 Place Louis Imbach',
           zip_code: '49000',
           city: 'Quelque part à Angers',
           latitude: 47.473826,
           longitude: -0.548895,
           url: 'https://github.com/mainelabs/techlist',
           logo_url: nil,
           twitter_name: nil,
           description: %{
# Qui sommes nous ?

Nous sommes une association réunissant des **professionnels et passionnés du numérique** d'Angers et sa région.

## Des événements

Nous faisons bouger *la vie numérique angevine* au travers d'événements ouverts à tous, et de nos contributions au monde open source.

## Des réalisations tech

Nous avons réalisé http://angers.io et avons ouvert son code source, qui est disponible sur Github.

# Comment nous aider ?

Vous pouvez nous aider de plein de façons. En adhérant à l'association, en organisant des événements, en nous filant un coup
de main de temps en temps, ou simplement en parlant de nous.
           })
    create(:place,
           :active,
           kind: 'accelerator',
           name: 'Angers technopole',
           street: '8 Rue André le Notre 49066 ',
           zip_code: '49100',
           city: 'Angers',
           latitude: 47.478667,
           longitude: -0.60619,
           url: 'http://angerstechnopole.com/',
           description: 'Courte description.',
           twitter_name: nil,
           logo_url: nil)
  end

  def create_searches
    header 'places'

    create(:search,
      page_title: 'Créer une application mobile à Angers',
      page_description: nil,
      results_one: 'entreprise',
      results_other: 'entreprises',
      slug: 'applications-mobiles-angers',
      kind: 'company',
      q: 'applications mobiles'
    )

    create(:search,
      page_title: 'Trouver une entreprise tech à Angers',
      page_description: nil,
      results_one: 'entreprise',
      results_other: 'entreprises',
      slug: 'entreprises-angers',
      kind: 'company',
      q: nil
    )
  end

  def header(msg)
    puts "Creating #{msg}\n"
  end

  def create(*args)
    FactoryGirl.create(*args)
  end
end
