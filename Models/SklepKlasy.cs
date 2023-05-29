using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;

public class Uzytkownik : DbContext 
{
    public int Id { get; set; }

    [Required]
    [StringLength(50)]
    public string Nazwa { get; set; }

    [Required]
    [StringLength(50)]
    public string Haslo { get; set; }

    [Required]
    [StringLength(50)]
    public string Imie { get; set; }

    [Required]
    [StringLength(50)]
    public string Nazwisko { get; set; }
}

public class Kategoria : DbContext
{
    public int Id { get; set; }

    [Required]
    [StringLength(50)]
    public string Nazwa { get; set; }
}

public class Podzespol : DbContext
{
    public int Id { get; set; }

    [Required]
    [StringLength(50)]
    public string Nazwa { get; set; }

    public decimal Cena { get; set; }

    public string Opis { get; set; }

    public int KategoriaId { get; set; }

    [ForeignKey("KategoriaId")]
    public Kategoria Kategoria { get; set; }
}

public class Koszyk : DbContext { 
    public int Id { get; set; }

    public int UzytkownikId { get; set; }

    public int PodzespolId { get; set; }

    public int Ilosc { get; set; }

    [ForeignKey("UzytkownikId")]
    public Uzytkownik Uzytkownik { get; set; }

    [ForeignKey("PodzespolId")]
    public Podzespol Podzespol { get; set; }
}

public class Koszyk_Podzespol : DbContext
{
    public int KoszykId { get; set; }

    public int PodzespolId { get; set; }

    public int Sztuki { get; set; }

    [ForeignKey("KoszykId")]
    public Koszyk Koszyk { get; set; }

    [ForeignKey("PodzespolId")]
    public Podzespol Podzespol { get; set; }
}