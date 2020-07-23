def run_sql(sql)
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'which_captain_are_you'})
    results = db.exec(sql) 
    db.close
    return results
end

def find_all_captains
    captains = run_sql("select * from captains;")
    return captains
end

def find_one_captain_by_id(id)
    captains = run_sql("select * from dishes where id = #{id};")
    return captains.first
end

# def create_dish(title, image_url, user_id)
#     sql = "insert into dishes (title,image_url,user_id) values ('#{title} ',' #{image_url} ', #{user_id});" 
#     run_sql(sql)   
#   end

# def delete_dish(id)
#     sql = "delete from dishes where id = '#{id}';" 
#     run_sql(sql)
# end

# def update_dish(id, title, image_url)
#     sql = "update dishes set title = '#{title}', image_url = '#{image_url}' where id = '#{id}';"
#     run_sql(sql)
# end