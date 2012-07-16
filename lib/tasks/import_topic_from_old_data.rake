# -*- encoding : utf-8 -*-

desc "导人文章数据"
task :import_topics => :environment do
	open("gbbs02mt.csv").readlines.each do |line|
		row = line.split(",").map { |e| e.strip }
		boradid = row[0].to_f

		topic = Topic.new

		user = User.find_by_login(row[6])
		
		if user.blank?
			topic.user_id = 0
		else
			topic.user_id = user.id
		end
		case boradid
		when 37
			topic.brand_id = 22
		when 11
			topic.brand_id = 16		
		when 12
			topic.brand_id = 8
		when 16
			topic.brand_id = 12
		when 17
			topic.brand_id = 21
		when 18
			topic.brand_id = 13
		when 19
			topic.brand_id = 11
		when 21
			topic.brand_id = 10
		when 25
			topic.brand_id = 18
		when 26
			topic.brand_id = 23
		when 28
			topic.brand_id = 23
		when 34
			topic.brand_id = 24
		end

		topic.title = row[5]
		topic.content = row[9]
		topic.status = 1
		topic.view_count = row[7]
		topic.save
		puts topic.title
		unless topic.save
			p topic.errors
		end
	end
end