# -*- encoding : utf-8 -*-

desc "导人用户数据"
task :import_users => :environment do
	open("users.csv").readlines.each do |line|
		row = line.split(",").map { |e| e.strip }

		user                       = User.new
		user.login                 = row[5]
        user.brand_id              = {"L" => "1", "M" => "2", "" => "", "S" => "4"}[row[10]]
        user.role_id               = row[14]
        user.user_ba               = row[5]
        user.status                = 1
        user.area_id               = row[25]  # 区域id
        user.counter               = row[21]  # 柜台号
		user.password              = row[1]
		user.password_confirmation = row[1]
		user.name                  = row[2]
		user.email                 = "#{user.login}@ssep.com"

		p user.login

		unless user.save
			p user.errors
		end
	end
end
