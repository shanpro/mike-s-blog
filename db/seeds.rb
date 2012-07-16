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

@calendar = Section.find_by_eng_name("calendars")
Section.create(
	[
		{title: "培训日历", eng_name: "trainning_cal", parent_id: @calendar.id},
		{title: "产品论坛", eng_name: "product_bbs", parent_id: @calendar.id}
	]
)

@best = Section.find_by_eng_name("best_practices")
Section.create(
	[
		{title: "优秀BP", eng_name: "good_bp", parent_id: @best.id},
		{title: "SSEP名次及结果", eng_name: "ssep_result", parent_id: @best.id},
		{title: "Best of Best", eng_name: "best_of_best", parent_id: @best.id},
		{title: "Star BA", eng_name: "star_ba", parent_id: @best.id},
		{title: "Star BAS", eng_name: "star_bas", parent_id: @best.id}
	]
)
@live_story = Section.find_by_eng_name("live_stories")
Section.create(
	[
		{title: "Free Talking", eng_name: "free_talking", parent_id: @live_story.id},
		{title: "赞美格式", eng_name: "praise_format", parent_id: @live_story.id},
		{title: "苦闷商量", eng_name: "anguish_discuss", parent_id: @live_story.id}
	]
)
@sales = Section.find_by_eng_name("sales")
Section.create(
	[
		{title: "月度计划书", eng_name: "month_plan", parent_id: @sales.id},
		{title: "柜台的优秀点", eng_name: "counter_good", parent_id: @sales.id}
	]
)
@ba = Section.find_by_eng_name("bas")
Section.create(
	[
		{title: "笔记本", eng_name: "notes", parent_id: @ba.id},
		{title: "BP事例", eng_name: "bp_case", parent_id: @ba.id},
		{title: "自传SSEP的课题", eng_name: "ssep_project", parent_id: @ba.id}
	]
)

@si = Section.find_by_eng_name("sis")
Section.create(
	[
		{title: "计划书", eng_name: "plan_book", parent_id: @si.id},
		{title: "结果书", eng_name: "result_book", parent_id: @si.id}
	]
)