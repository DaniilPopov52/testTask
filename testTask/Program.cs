using Dapper;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using testTask.Models;

namespace testTask
{
    class Program
    {
        static string connectionString = "Host=localhost;Username=postgres;Password=bekhen7a37;Database=testTask";
        static IDbConnection OpenConnection(string connectionString)
        {
            var connection = new NpgsqlConnection(connectionString);
            connection.Open();
            return connection;
        }
        static void Main(string[] args)
        {
            using (var connection = OpenConnection(connectionString))
            {
                var users = GetUsers(connection);
                foreach (var user in users)
                {
                    Console.Write($"Имя: {user.Name}. Роли: ");
                    foreach (var role in user.Roles)
                    {
                        Console.Write($"{role.Role_Name} ");
                    }
                    Console.WriteLine("");
                }
                var roles = GetRoles(connection);
                foreach (var role in roles)
                {
                    Console.WriteLine($"Роль: {role.Role_Name}. Кол-во пользователей: {role.User_count}");
                }
            }
            Console.ReadKey();
        }
        static IEnumerable<User> GetUsers(IDbConnection connection)
        {
            string query = @"SELECT u.id, u.name, r.id, r.role_name
                             FROM users u
                             JOIN userrole ur ON u.id = ur.user_id
                             JOIN roles r ON r.id = ur.role_id";

            var dict = new Dictionary<Guid, User>();

            var result = connection.Query<User, Role, User>(query, 
                (user, role) =>
                {
                    if (dict.TryGetValue(user.Id, out var _user))
                    {
                        user = _user;
                        user.Roles.Add(role);
                    }
                    else
                    {
                        user.Roles.Add(role);
                        dict.Add(user.Id, user);
                    }
                    return user;
                }, "id");

            return dict.Values.ToList();
        }
        static IEnumerable<Role> GetRoles(IDbConnection connection)
        {
            string query = @"SELECT r.id, r.role_name, COUNT(*) AS User_count
                             FROM roles r
                             JOIN userrole ur ON ur.role_id = r.id
                             GROUP BY r.id, r.role_name";
            var result = connection.Query<Role>(query);
            return result.ToList(); ;
        }
    }
}
