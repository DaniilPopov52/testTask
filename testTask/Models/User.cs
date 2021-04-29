using System;
using System.Collections.Generic;

namespace testTask.Models
{
    public class User
    {
        public Guid Id { get; set;}
        public string Name { get; set; }
        public List<Role> Roles { get; set; } = new List<Role>();
    }
}
