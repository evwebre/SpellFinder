class FetchSpellsJob < ApplicationJob
  queue_as :default

  def perform
    for i in 1..(DNDService.instance.spell_count)
      spell_json = DNDService.instance.retrieve_spell(i)
      spell = Spell.where(name: spell_json['name']).first_or_initialize
      
      spell.description = ""

      spell_json['desc'].each do |description|
        spell.description = spell.description + "#{description}. "
      end

      # fix database weirdness
      spell.description = spell.description.gsub("â€™", "'")
      spell.description = spell.description.gsub("â€�", "")
      spell.description = spell.description.gsub("â€œ", "")
      spell.description = spell.description.gsub("..", ".")


      spell.higher_level = ""

      if spell_json['higher_level']
        spell_json['higher_level'].each do |level|
          spell.higher_level = spell.higher_level + "#{level}. "
        end
      end

      spell.higher_level = spell.higher_level.chomp('.')

      spell.range = spell_json['range']
      spell.casting_time = spell_json['casting_time']

      spell.classes = ""

      spell_json['classes'].each do |spell_class|
        spell.classes =  spell.classes + "#{spell_class['name']}, "
      end

      spell.classes = spell.classes.chomp(', ')

      spell.save
    end

  end
end
