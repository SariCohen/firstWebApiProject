using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entities.Models;

public partial class User
{
    public int Id { get; set; }
    [EmailAddress(ErrorMessage = " UserName must be an email")]
    [Required(ErrorMessage = " UserName is required")]
    public string UserName { get; set; } = null!;
    [Required(ErrorMessage = "Password is required")]
    public string Password { get; set; }
    [StringLength(8, ErrorMessage = "Name can't be lonnger than 8.")]
    public string Name { get; set; } = null!;
    [StringLength(8, ErrorMessage = "Name can't be lonnger than 8.")]
    public string LastName { get; set; } = null!;
}
