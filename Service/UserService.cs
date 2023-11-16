using Entities.Models;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zxcvbn;

namespace Service
{
    //Rename folder to Services
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        public UserService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<User> GetUserByEmailAndPassword(string email, string password)
        {
            return await _userRepository.GetUserByEmailAndPassword(email, password);
        }

        public async Task<User> GetUserById(int id)
        {
            return await _userRepository.GetUserById(id);
        }

        public async Task<User> AddUser(User user)
        {
            return await _userRepository.AddUser(user);
        }

        public async Task<int> CheckPwd(string password)
        {
            var result = Zxcvbn.Core.EvaluatePassword(password);
            return result.Score;
        }

        public async Task<User> UpdateUser(int id, User user)
        {
            return await _userRepository.UpdateUser(id, user);
        }
    }
}
