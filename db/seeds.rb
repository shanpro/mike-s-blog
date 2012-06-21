# -*- encoding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Section.create(
	[
		{title: "新闻", eng_name: "news"},
		{title: "产品及培训日历", eng_name: "calendars"},
		{title: "Best Practice", eng_name: "best_practices"},
		{title: "生活故事", eng_name: "live_stories"},
		{title: "销售人员提案", eng_name: "sales"},
		{title: "BA课题", eng_name: "bas"},
		{title: "Trainer&Coach活动计划", eng_name: "sis"}
	]

	)