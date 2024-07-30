using Entities.Models;
using Moq;
using Moq.EntityFrameworkCore;
using Repositories;
namespace TestProject
{
    public class UnitTest
    {
        [Fact]
        public async Task GetUser_ValidCredentials_ReurnsUser()
        {
            var user = new User { UserName = "test@example.com", Password = "test1234" };

            var mockContext = new Mock<Store214493777Context>();
            var users = new List<User>() { user };
            mockContext.Setup(x => x.Users).ReturnsDbSet(users);

            var userRepository = new UserRepository(mockContext.Object);

            var result = await userRepository.GetUserByEmailAndPassword(user.UserName, user.Password);

            Assert.Equal(user, result);
        }
    }
}