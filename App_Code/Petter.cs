using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Holds animal values taken from database when bringing up a new animal
/// </summary>
public class Petter
{
    public int anid { get; set; }
    public string name { get; set; }
    public string description { get; set; }
    public string image { get; set; }
    public int soft { get; set; }
    public int hard { get; set; }
}