CREATE TABLE public.flyway_schema_history (
    installed_rank INTEGER NOT NULL
        CONSTRAINT flyway_schema_history_pk PRIMARY KEY,
    version VARCHAR(50),
    description VARCHAR(200) NOT NULL,
    type VARCHAR(20) NOT NULL,
    script VARCHAR(1000) NOT NULL,
    checksum INTEGER,
    installed_by VARCHAR(100) NOT NULL,
    installed_on TIMESTAMP DEFAULT NOW() NOT NULL,
    execution_time INTEGER NOT NULL,
    success BOOLEAN NOT NULL
);

ALTER TABLE public.flyway_schema_history OWNER TO core;

CREATE INDEX  flyway_schema_history_s_idx
    ON public.flyway_schema_history (success);

CREATE TABLE  public.recipe_templates (
    id BIGSERIAL PRIMARY KEY,
    author VARCHAR(100) NOT NULL,
    owner_org_id VARCHAR(100),
    owner_user_id VARCHAR(100),
    owner_team_id VARCHAR(100),
    scope VARCHAR(20) NOT NULL,
    prompt TEXT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    recipe_server TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.recipe_templates OWNER TO core;

CREATE INDEX  idx_recipe_name
    ON public.recipe_templates (name);

CREATE INDEX  idx_recipe_author
    ON public.recipe_templates (author);

CREATE TRIGGER update_recipe_templates_updated_at
    BEFORE UPDATE ON public.recipe_templates
    FOR EACH ROW
    EXECUTE PROCEDURE public.update_updated_at_column();

CREATE TABLE  public.recipe_tags (
    recipe_id BIGINT NOT NULL
        REFERENCES public.recipe_templates ON DELETE CASCADE,
    tag VARCHAR(50) NOT NULL,
    PRIMARY KEY (recipe_id, tag)
);

ALTER TABLE public.recipe_tags OWNER TO core;

CREATE INDEX  idx_recipe_tags
    ON public.recipe_tags (tag);

CREATE TABLE  public.recipe_llms (
    recipe_id BIGINT NOT NULL
        REFERENCES public.recipe_templates ON DELETE CASCADE,
    llm_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (recipe_id, llm_name)
);

ALTER TABLE public.recipe_llms OWNER TO core;

CREATE TABLE  public.core_instances (
);

ALTER TABLE public.core_instances OWNER TO core;