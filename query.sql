create database mini_poke_proj;
use mini_poke_proj;

-- Player
drop table player;
CREATE TABLE player (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    login_id VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT `uq_player_login_id` UNIQUE (login_id),
    CONSTRAINT `uq_player_username` UNIQUE (username)
    
)	ENGINE=InnoDB
	DEFAULT CHARSET = utf8mb4
	COLLATE = utf8mb4_unicode_ci
	COMMENT = 'player';

-- Pokemon
drop table pokemon;
CREATE TABLE pokemon (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    type VARCHAR(20) NOT NULL,
    hp INT DEFAULT 1,
    attack INT DEFAULT 1,
    defense INT DEFAULT 1,
    speed INT DEFAULT 1,
    
    
    CONSTRAINT `chk_pokemon_type` CHECK(type IN ('NOMAL','FIRE', 'GRASS', 'WATER')),
    
    constraint chk_hp check (hp >= 0),
    constraint chk_attack check (attack >= 0),
    constraint chk_defense check (defense >= 0),
    constraint chk_speed check (speed >= 0)
    
)	ENGINE=InnoDB
	DEFAULT CHARSET = utf8mb4
	COLLATE = utf8mb4_unicode_ci
	COMMENT = 'pokemon';

-- Player's Pokemon
drop table player_pokemon;
CREATE TABLE player_pokemon (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    player_id BIGINT,
    pokemon_id BIGINT,
    nickname VARCHAR(50),
    level INT DEFAULT 1,
    exp INT DEFAULT 0,
    
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_playerid_userid FOREIGN KEY (player_id) REFERENCES player(id),
    CONSTRAINT fk_pokemonid_id FOREIGN KEY (pokemon_id) REFERENCES pokemon(id),
    
    constraint chk_level check (level >= 1),
    constraint chk_exp check (exp >= 1)
    
)	ENGINE=InnoDB
	DEFAULT CHARSET = utf8mb4
	COLLATE = utf8mb4_unicode_ci
	COMMENT = 'player_pokemon';
    
-- Move
drop table skill;
CREATE TABLE skill (
    skill_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20),
    power INT DEFAULT 1,
    accuracy INT DEFAULT 1,
    pp INT DEFAULT 1,
    
    CONSTRAINT `chk_skill_type` CHECK(type IN ('NORMAL','FIRE', 'GRASS', 'WATER')),
    
    constraint chk_power check (power >= 0),
    constraint chk_accuracy check (accuracy >= 0),
    constraint chk_pp check (pp >= 0)
    
)	ENGINE=InnoDB
	DEFAULT CHARSET = utf8mb4
	COLLATE = utf8mb4_unicode_ci
	COMMENT = 'skill';

-- player_pokemon_skill
drop table player_pokemon_skill;
CREATE TABLE player_pokemon_skill (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    player_pokemon_id BIGINT NOT NULL,
    skill_id BIGINT NOT NULL,
    pp_remaining INT DEFAULT 0,

    CONSTRAINT fk_player_pokemon_id FOREIGN KEY(player_pokemon_id) REFERENCES player_pokemon(id),
    CONSTRAINT fk_player_pokemon_skill FOREIGN KEY (skill_id) REFERENCES skill(skill_id),
    
    CONSTRAINT `uq_player_pokemon_skill` UNIQUE (skill_id)
    
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  COMMENT = '플레이어 개별 포켓몬의 스킬';




-- Pokemon can learn Move
drop table pokemon_skill;
CREATE TABLE pokemon_skill (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pokemon_id BIGINT,
    skill_id BIGINT,
--     level_required INT,
    CONSTRAINT fk_pokemon_id FOREIGN KEY (pokemon_id) REFERENCES pokemon(id),
    CONSTRAINT fk_pokemon_skill_id FOREIGN KEY (skill_id) REFERENCES skill(skill_id),
    
    CONSTRAINT `fk_pokemon_skill_id` UNIQUE (skill_id)
    
)	ENGINE=InnoDB
	DEFAULT CHARSET = utf8mb4
	COLLATE = utf8mb4_unicode_ci
	COMMENT = 'pokemon_skill';
