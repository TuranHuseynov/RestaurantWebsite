//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PubRestoran.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Yemey
    {
        public int id { get; set; }
        public Nullable<int> category_id { get; set; }
        public Nullable<int> olke_id { get; set; }
        public string price { get; set; }
        public string yemek_adi { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual Olke Olke { get; set; }
    }
}
