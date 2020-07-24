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

def find_random_captain
    captain = find_all_captains.to_a.sample()
    return captain
end

def find_one_captain_by_id(id)
    captains = run_sql("select * from captains where id = #{id};")
    return captains.first
end

