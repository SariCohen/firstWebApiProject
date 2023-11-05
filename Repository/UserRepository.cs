using Entities.Models;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly Store214493777Context _store214493777Context;

        public UserRepository()
        {
            _store214493777Context = new Store214493777Context();
        }

        public async Task<User> GetUserByEmailAndPassword(string email, string password)
        {
            //using (StreamReader reader = System.IO.File.OpenText(filePath))
            //{
            //    string? currentUserInFile;
            //    while ((currentUserInFile = await reader.ReadLineAsync()) != null)
            //    {
            //        User user = JsonSerializer.Deserialize<User>(currentUserInFile);
            //        if (user.UserName == email && user.Password == password)
            //            return user;
            //    }
            //}
            return null;
        }

        public async Task<User> GetUserById(int id)
        {
            // return await _store214493777Context.FindAsync();
            return null;
        }

        public async Task<User> AddUser(User user)
        {
            await _store214493777Context.AddAsync(user);
            await _store214493777Context.SaveChangesAsync();
            return user;
        }

        public async Task<User> UpdateUser(int id, User upUser)
        {
            //string textToReplace = string.Empty;
            //using (StreamReader reader = System.IO.File.OpenText(filePath))
            //{
            //    string currentUserInFile;
            //    while ((currentUserInFile = await reader.ReadLineAsync()) != null)
            //    {
            //        User user = JsonSerializer.Deserialize<User>(currentUserInFile);
            //        if (user.Id == id)
            //            textToReplace = currentUserInFile;
            //    }
            //}
            //if (textToReplace != string.Empty)
            //{
            //    string text = await System.IO.File.ReadAllTextAsync(filePath);
            //    text = text.Replace(textToReplace, JsonSerializer.Serialize(upUser));
            //    await System.IO.File.WriteAllTextAsync(filePath, text);
            //    return upUser;
            //}
            return null;
        }
    }
}



