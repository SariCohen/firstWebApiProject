using Repositories;
using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestProject
{
    public class IntegrationTest: IClassFixture<DatabaseFixture>
    {
        private readonly Store214493777Context _dbContext;
        private readonly UserRepository _userRepository;

        public IntegrationTest(DatabaseFixture databaseFixture)
        {
            _dbContext = databaseFixture.Context;
            _userRepository = new UserRepository(_dbContext);
        }

        [Fact]
        public async Task GetUser_ValidCredentials_ReturnsUser()
        {
            var userName = "sariTest@example.com";
            var password = "password1234";
            var user = new User { UserName = userName, Password = password, Name="Sari", LastName ="Cohen" };
            await _dbContext.Users.AddAsync(user);
            await _dbContext.SaveChangesAsync();

            var result = await _userRepository.GetUserByEmailAndPassword(userName, password);

            Assert.NotNull(result);
        }
    }
}
