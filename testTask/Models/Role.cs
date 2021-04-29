using System;
using System.Collections.Generic;

namespace testTask.Models
{
    public class Role
    {
        public Guid Id { get; set; }
        public string Role_Name { get; set; }
        public int User_count { get; set; }
    }
}
