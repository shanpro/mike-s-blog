# -*- encoding : utf-8 -*-

desc "导人用户数据"
task :import_users => :environment do
	open("users.csv").readlines.each do |line|
		row = line.split(",").map { |e| e.strip }

		user = User.new
		user.login = row[5]
		user.password = row[1]
		user.password_confirmation = row[1]
		user.name = row[2]
		user.email = "#{user.login}@ssep.com"

		p user.login

		unless user.save
			p user.errors
		end
	end
end