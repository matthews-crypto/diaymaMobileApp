class Vendeur {
  final String nom;
  final String prenom;
  final String login;
  final String telephone;
  final String moyenPaiement;
  final String nomBoutique;
  final String cin;
  final String email;
  final String typeVendeur;

  Vendeur(this.nom, this.prenom, this.login, this.telephone, this.moyenPaiement,
      this.nomBoutique, this.cin, this.email, this.typeVendeur);

  Vendeur.fromJson(Map<String, dynamic> json)
      : nom = json['nom'],
        prenom = json['prenom'],
        login = json['login'],
        telephone = json['telephone'],
        moyenPaiement = json['moyenPaiement'],
        nomBoutique = json['nomBoutique'],
        cin = json['cin'],
        email = json['email'],
        typeVendeur = json['typeVendeur'];

  Map<String, dynamic> toJson() => {
        'nom': nom,
        'prenom': prenom,
        'login': login,
        'telephone': telephone,
        'moyenPaiement': moyenPaiement,
        'nomBoutique': nomBoutique,
        'cin': cin,
        'email': email,
        'typeVendeur': typeVendeur,
      };
}
