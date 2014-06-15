require "#{Rails.root}/app/models/monster"
require "#{Rails.root}/app/models/dungeon"

# YAMLファイル読み込み
CONF = YAML.load(File.open("#{Rails.root}/config/gameconfig.yml"))
JOBS = YAML.load(File.open("#{Rails.root}/config/jobdata.yml"))
DUNGEONS = YAML.load(File.open("#{Rails.root}/config/dungeondata.yml"))
MONSTERS = YAML.load(File.open("#{Rails.root}/config/monsterdata.yml"))
