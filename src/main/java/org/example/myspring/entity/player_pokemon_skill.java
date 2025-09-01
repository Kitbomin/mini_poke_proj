package org.example.myspring.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "player_pokemon_skill")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class player_pokemon_skill {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    @JoinColumn(name = "player_pokemon_id", nullable = false,
            foreignKey = @ForeignKey(name = "fk_player_pokemon_id"))
    private PlayerPokemon playerPokemon;

    @OneToOne
    @JoinColumn(name = "skill_id", nullable = false,
            foreignKey = @ForeignKey(name = "fk_player_pokemon_skill"))
    private Skill skill;

    @Column
    private int pp_remaining;
}
