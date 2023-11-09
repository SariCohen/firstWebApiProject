using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace Entities.Models;

public partial class User
{
    public int Id { get; set; }

    public string UserName { get; set; } = null!;
    [EmailAddress]
    [Required]
    public string Password { get; set; } = null!;
    [Required]

    public string Name { get; set; } = null!;
    [StringLength(8, ErrorMessage = "Name can't be longer then 8.")]

    public string LastName { get; set; } = null!;
    [StringLength(8, ErrorMessage = "Last name can't be longer then 8.")]

    [JsonIgnore]
    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
