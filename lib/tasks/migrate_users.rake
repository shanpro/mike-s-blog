# -*- encoding : utf-8 -*-

desc "迁移用户数据"
task :migrate_users => :environment do
	open("users.csv").readlines.each do |line|
		row = line.split(",").map { |e| e.strip }

    if user = User.find_by_login(row[5])
      user.brand_id              = {"L" => "1", "M" => "2", "" => "", "S" => "4"}[row[10]]
      user.role_id               = row[14]
      user.user_ba               = row[5]
      user.status                = 1
      user.area_id               = row[25]  # 区域id
      user.counter               = row[21]  # 柜台号
    end
		p user.login

		unless user.save
			p user.errors
		end
	end
end


