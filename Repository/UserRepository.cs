using Entities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly Store214493777Context _store214493777Context;

        public UserRepository(Store214493777Context store214493777Context)
        {
            _store214493777Context = store214493777Context;
        }

        public async Task<User> GetUserByEmailAndPassword(string email, string password)
        {
            return await _store214493777Context.Users.Where(user => user.UserName == email && user.Password == password).FirstOrDefaultAsync();
        }

        public async Task<User> GetUserById(int id)
        {
            return await _store214493777Context.Users.FindAsync(id);
            
        }

        public async Task<User> AddUser(User user)
        {
            await _store214493777Context.Users.AddAsync(user);
            await _store214493777Context.SaveChangesAsync();
            return user;
        }

        public async Task<User> UpdateUser(int id, User upUser)
        {
            _store214493777Context.Update(upUser);
            await _store214493777Context.SaveChangesAsync();
            return upUser;
        }
    }
}



