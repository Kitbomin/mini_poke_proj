package org.example.myspring.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.example.myspring.common.enums.Type;

@Entity
@Table(name = "skill")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Skill{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int skill_id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private Type type;

    @Column
    private int power;

    @Column
    private int accuracy;

    @Column
    private int pp;

}
