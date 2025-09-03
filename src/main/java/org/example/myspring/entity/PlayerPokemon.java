package org.example.myspring.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.example.myspring.entity.base.BaseTimeEntity;

@Entity
@Table(name = "player_pokemon")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class PlayerPokemon extends BaseTimeEntity {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "player_id", nullable = false,
            foreignKey = @ForeignKey(name = "fk_playerid_userid"))
    private Player player;

    @ManyToOne
    @JoinColumn(name = "pokemon_id", nullable = false,
            foreignKey = @ForeignKey(name = "fk_pokemonid_id"))
    private Pokemon pokemon;

}
