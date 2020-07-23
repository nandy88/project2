require "bcrypt"


def find_all_users
    return run_sql("select * from users")
end

def find_one_user_by_id(id)
    users = run_sql("select * from users where id = #{id};")
    return users.first
end

def find_one_user_by_username(username)
    users = run_sql("select * from users where username = '#{username}';")
    return users.first
end

def create_user(name,email,username,password_digest)
    password_digest = BCrypt::Password.create(password)
    sql = "insert into users (name,email,username,password_digest) values ('#{name}','#{email}','#{username}','#{password_digest}');"
    run_sql(sql)
end

def destroy_user(id)
    sql = "delete from users where id = #{id};"
    run_sql(sql)
end