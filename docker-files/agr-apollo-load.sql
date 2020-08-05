--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: allele; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.allele (
    id bigint NOT NULL,
    version bigint NOT NULL,
    bases character varying(255) NOT NULL,
    reference boolean NOT NULL,
    variant_id bigint
);


ALTER TABLE public.allele OWNER TO apollo2_user;

--
-- Name: allele_info; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.allele_info (
    id bigint NOT NULL,
    version bigint NOT NULL,
    allele_id bigint NOT NULL,
    tag character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.allele_info OWNER TO apollo2_user;

--
-- Name: analysis; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.analysis (
    id bigint NOT NULL,
    version bigint NOT NULL,
    algorithm character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    program character varying(255) NOT NULL,
    program_version character varying(255) NOT NULL,
    source_name character varying(255) NOT NULL,
    sourceuri character varying(255) NOT NULL,
    source_version character varying(255) NOT NULL,
    time_executed timestamp without time zone NOT NULL
);


ALTER TABLE public.analysis OWNER TO apollo2_user;

--
-- Name: analysis_feature; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.analysis_feature (
    id bigint NOT NULL,
    version bigint NOT NULL,
    analysis_id bigint NOT NULL,
    feature_id bigint NOT NULL,
    identity double precision NOT NULL,
    normalized_score double precision NOT NULL,
    raw_score double precision NOT NULL,
    significance double precision NOT NULL
);


ALTER TABLE public.analysis_feature OWNER TO apollo2_user;

--
-- Name: analysis_property; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.analysis_property (
    id bigint NOT NULL,
    version bigint NOT NULL,
    analysis_id bigint NOT NULL,
    type_id bigint NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.analysis_property OWNER TO apollo2_user;

--
-- Name: application_preference; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.application_preference (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.application_preference OWNER TO apollo2_user;

--
-- Name: audit_log; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.audit_log (
    id bigint NOT NULL,
    actor character varying(255),
    class_name character varying(255),
    date_created timestamp without time zone NOT NULL,
    event_name character varying(255),
    last_updated timestamp without time zone NOT NULL,
    new_value character varying(255),
    old_value character varying(255),
    persisted_object_id character varying(255),
    persisted_object_version bigint,
    property_name character varying(255),
    uri character varying(255)
);


ALTER TABLE public.audit_log OWNER TO apollo2_user;

--
-- Name: available_status; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.available_status (
    id bigint NOT NULL,
    version bigint NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.available_status OWNER TO apollo2_user;

--
-- Name: available_status_feature_type; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.available_status_feature_type (
    available_status_feature_types_id bigint,
    feature_type_id bigint
);


ALTER TABLE public.available_status_feature_type OWNER TO apollo2_user;

--
-- Name: canned_comment; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.canned_comment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    comment character varying(255) NOT NULL,
    metadata character varying(255)
);


ALTER TABLE public.canned_comment OWNER TO apollo2_user;

--
-- Name: canned_comment_feature_type; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.canned_comment_feature_type (
    canned_comment_feature_types_id bigint,
    feature_type_id bigint
);


ALTER TABLE public.canned_comment_feature_type OWNER TO apollo2_user;

--
-- Name: canned_key; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.canned_key (
    id bigint NOT NULL,
    version bigint NOT NULL,
    label character varying(255) NOT NULL,
    metadata character varying(255)
);


ALTER TABLE public.canned_key OWNER TO apollo2_user;

--
-- Name: canned_key_feature_type; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.canned_key_feature_type (
    canned_key_feature_types_id bigint,
    feature_type_id bigint
);


ALTER TABLE public.canned_key_feature_type OWNER TO apollo2_user;

--
-- Name: canned_value; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.canned_value (
    id bigint NOT NULL,
    version bigint NOT NULL,
    label character varying(255) NOT NULL,
    metadata character varying(255)
);


ALTER TABLE public.canned_value OWNER TO apollo2_user;

--
-- Name: canned_value_feature_type; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.canned_value_feature_type (
    canned_value_feature_types_id bigint,
    feature_type_id bigint
);


ALTER TABLE public.canned_value_feature_type OWNER TO apollo2_user;

--
-- Name: custom_domain_mapping; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.custom_domain_mapping (
    id bigint NOT NULL,
    version bigint NOT NULL,
    alternate_cv_term character varying(255),
    cv_term character varying(255) NOT NULL,
    is_transcript boolean NOT NULL,
    ontology_id character varying(255) NOT NULL
);


ALTER TABLE public.custom_domain_mapping OWNER TO apollo2_user;

--
-- Name: cv; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.cv (
    id bigint NOT NULL,
    version bigint NOT NULL,
    definition character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.cv OWNER TO apollo2_user;

--
-- Name: cvterm; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.cvterm (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cv_id bigint NOT NULL,
    dbxref_id bigint NOT NULL,
    definition character varying(255) NOT NULL,
    is_obsolete integer NOT NULL,
    is_relationship_type integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.cvterm OWNER TO apollo2_user;

--
-- Name: cvterm_path; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.cvterm_path (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cv_id bigint NOT NULL,
    objectcvterm_id bigint NOT NULL,
    path_distance integer NOT NULL,
    subjectcvterm_id bigint NOT NULL,
    type_id bigint NOT NULL
);


ALTER TABLE public.cvterm_path OWNER TO apollo2_user;

--
-- Name: cvterm_relationship; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.cvterm_relationship (
    id bigint NOT NULL,
    version bigint NOT NULL,
    objectcvterm_id bigint NOT NULL,
    subjectcvterm_id bigint NOT NULL,
    type_id bigint NOT NULL
);


ALTER TABLE public.cvterm_relationship OWNER TO apollo2_user;

--
-- Name: data_adapter; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.data_adapter (
    id bigint NOT NULL,
    version bigint NOT NULL,
    export_source_genomic_sequence boolean,
    feature_type_string character varying(255),
    implementation_class character varying(255),
    data_adapter_key character varying(255) NOT NULL,
    options character varying(255),
    permission character varying(255) NOT NULL,
    source character varying(255),
    temp_directory character varying(255)
);


ALTER TABLE public.data_adapter OWNER TO apollo2_user;

--
-- Name: data_adapter_data_adapter; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.data_adapter_data_adapter (
    data_adapter_data_adapters_id bigint,
    data_adapter_id bigint
);


ALTER TABLE public.data_adapter_data_adapter OWNER TO apollo2_user;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.databasechangelog (
    id character varying(63) NOT NULL,
    author character varying(63) NOT NULL,
    filename character varying(200) NOT NULL,
    dateexecuted timestamp with time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20)
);


ALTER TABLE public.databasechangelog OWNER TO apollo2_user;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp with time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO apollo2_user;

--
-- Name: db; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.db (
    id bigint NOT NULL,
    version bigint NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL,
    url character varying(255),
    url_prefix character varying(255)
);


ALTER TABLE public.db OWNER TO apollo2_user;

--
-- Name: dbxref; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.dbxref (
    id bigint NOT NULL,
    version character varying(255),
    accession character varying(255) NOT NULL,
    db_id bigint NOT NULL,
    description character varying(255)
);


ALTER TABLE public.dbxref OWNER TO apollo2_user;

--
-- Name: dbxref_property; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.dbxref_property (
    id bigint NOT NULL,
    version bigint NOT NULL,
    dbxref_id bigint NOT NULL,
    rank integer NOT NULL,
    type_id bigint NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.dbxref_property OWNER TO apollo2_user;

--
-- Name: environment; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.environment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    description character varying(255) NOT NULL,
    uniquename character varying(255) NOT NULL
);


ALTER TABLE public.environment OWNER TO apollo2_user;

--
-- Name: environmentcvterm; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.environmentcvterm (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cvterm_id bigint NOT NULL,
    environment_id bigint NOT NULL
);


ALTER TABLE public.environmentcvterm OWNER TO apollo2_user;

--
-- Name: feature; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    dbxref_id bigint,
    description text,
    is_analysis boolean NOT NULL,
    is_obsolete boolean NOT NULL,
    last_updated timestamp without time zone,
    md5checksum character varying(255),
    name text NOT NULL,
    sequence_length integer,
    status_id bigint,
    symbol character varying(255),
    unique_name character varying(255) NOT NULL,
    class character varying(255) NOT NULL,
    analysis_feature_id bigint,
    alternate_cv_term character varying(255),
    class_name character varying(255),
    custom_alternate_cv_term character varying(255),
    custom_class_name character varying(255),
    custom_cv_term character varying(255),
    custom_ontology_id character varying(255),
    cv_term character varying(255),
    meta_data text,
    ontology_id character varying(255),
    alteration_residue character varying(255),
    deletion_length integer,
    reference_allele_id bigint
);


ALTER TABLE public.feature OWNER TO apollo2_user;

--
-- Name: feature_dbxref; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_dbxref (
    feature_featuredbxrefs_id bigint,
    dbxref_id bigint
);


ALTER TABLE public.feature_dbxref OWNER TO apollo2_user;

--
-- Name: feature_event; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_event (
    id bigint NOT NULL,
    version bigint NOT NULL,
    child_id bigint,
    child_split_id bigint,
    current boolean NOT NULL,
    date_created timestamp without time zone NOT NULL,
    editor_id bigint,
    last_updated timestamp without time zone NOT NULL,
    name text NOT NULL,
    new_features_json_array text,
    old_features_json_array text,
    operation character varying(255) NOT NULL,
    original_json_command text,
    parent_id bigint,
    parent_merge_id bigint,
    unique_name character varying(255) NOT NULL
);


ALTER TABLE public.feature_event OWNER TO apollo2_user;

--
-- Name: feature_feature_phenotypes; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_feature_phenotypes (
    feature_id bigint NOT NULL,
    phenotype_id bigint NOT NULL
);


ALTER TABLE public.feature_feature_phenotypes OWNER TO apollo2_user;

--
-- Name: feature_genotype; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_genotype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cgroup integer NOT NULL,
    chromosome_feature_id bigint NOT NULL,
    cvterm_id bigint NOT NULL,
    feature_id bigint NOT NULL,
    feature_genotype_id integer NOT NULL,
    genotype_id bigint NOT NULL,
    rank integer NOT NULL
);


ALTER TABLE public.feature_genotype OWNER TO apollo2_user;

--
-- Name: feature_grails_user; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_grails_user (
    feature_owners_id bigint,
    user_id bigint
);


ALTER TABLE public.feature_grails_user OWNER TO apollo2_user;

--
-- Name: feature_location; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_location (
    id bigint NOT NULL,
    version bigint NOT NULL,
    feature_id bigint NOT NULL,
    fmax integer NOT NULL,
    fmin integer NOT NULL,
    is_fmax_partial boolean NOT NULL,
    is_fmin_partial boolean NOT NULL,
    locgroup integer NOT NULL,
    phase integer,
    rank integer NOT NULL,
    residue_info character varying(255),
    sequence_id bigint NOT NULL,
    strand integer
);


ALTER TABLE public.feature_location OWNER TO apollo2_user;

--
-- Name: feature_location_publication; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_location_publication (
    feature_location_feature_location_publications_id bigint,
    publication_id bigint
);


ALTER TABLE public.feature_location_publication OWNER TO apollo2_user;

--
-- Name: feature_property; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_property (
    id bigint NOT NULL,
    version bigint NOT NULL,
    feature_id bigint NOT NULL,
    rank integer NOT NULL,
    tag character varying(255),
    type_id bigint,
    value text NOT NULL,
    class character varying(255) NOT NULL
);


ALTER TABLE public.feature_property OWNER TO apollo2_user;

--
-- Name: feature_property_publication; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_property_publication (
    feature_property_feature_property_publications_id bigint,
    publication_id bigint
);


ALTER TABLE public.feature_property_publication OWNER TO apollo2_user;

--
-- Name: feature_publication; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_publication (
    feature_feature_publications_id bigint,
    publication_id bigint
);


ALTER TABLE public.feature_publication OWNER TO apollo2_user;

--
-- Name: feature_relationship; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_relationship (
    id bigint NOT NULL,
    version bigint NOT NULL,
    child_feature_id bigint NOT NULL,
    parent_feature_id bigint NOT NULL,
    rank integer NOT NULL,
    value character varying(255)
);


ALTER TABLE public.feature_relationship OWNER TO apollo2_user;

--
-- Name: feature_relationship_feature_property; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_relationship_feature_property (
    feature_relationship_feature_relationship_properties_id bigint,
    feature_property_id bigint
);


ALTER TABLE public.feature_relationship_feature_property OWNER TO apollo2_user;

--
-- Name: feature_relationship_publication; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_relationship_publication (
    feature_relationship_feature_relationship_publications_id bigint,
    publication_id bigint
);


ALTER TABLE public.feature_relationship_publication OWNER TO apollo2_user;

--
-- Name: feature_synonym; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_synonym (
    id bigint NOT NULL,
    version bigint NOT NULL,
    feature_id bigint NOT NULL,
    is_current boolean,
    is_internal boolean,
    publication_id bigint,
    synonym_id bigint NOT NULL,
    feature_synonyms_id bigint
);


ALTER TABLE public.feature_synonym OWNER TO apollo2_user;

--
-- Name: feature_type; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.feature_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    display character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    ontology_id character varying(255) NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE public.feature_type OWNER TO apollo2_user;

--
-- Name: featurecvterm; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.featurecvterm (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cvterm_id bigint NOT NULL,
    feature_id bigint NOT NULL,
    is_not boolean NOT NULL,
    publication_id bigint NOT NULL,
    rank integer NOT NULL
);


ALTER TABLE public.featurecvterm OWNER TO apollo2_user;

--
-- Name: featurecvterm_dbxref; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.featurecvterm_dbxref (
    featurecvterm_featurecvtermdbxrefs_id bigint,
    dbxref_id bigint
);


ALTER TABLE public.featurecvterm_dbxref OWNER TO apollo2_user;

--
-- Name: featurecvterm_publication; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.featurecvterm_publication (
    featurecvterm_featurecvterm_publications_id bigint,
    publication_id bigint
);


ALTER TABLE public.featurecvterm_publication OWNER TO apollo2_user;

--
-- Name: genotype; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.genotype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    description character varying(255) NOT NULL,
    genotype_id integer NOT NULL,
    name character varying(255) NOT NULL,
    unique_name character varying(255) NOT NULL
);


ALTER TABLE public.genotype OWNER TO apollo2_user;

--
-- Name: go_annotation; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.go_annotation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    aspect character varying(255) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    evidence_ref character varying(255) NOT NULL,
    feature_id bigint NOT NULL,
    gene_product_relationship_ref character varying(255),
    go_ref character varying(255) NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    negate boolean NOT NULL,
    notes_array character varying(255),
    reference character varying(255) NOT NULL,
    with_or_from_array character varying(255),
    evidence_ref_label character varying(255),
    go_ref_label character varying(255)
);


ALTER TABLE public.go_annotation OWNER TO apollo2_user;

--
-- Name: go_annotation_grails_user; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.go_annotation_grails_user (
    go_annotation_owners_id bigint,
    user_id bigint
);


ALTER TABLE public.go_annotation_grails_user OWNER TO apollo2_user;

--
-- Name: go_term; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.go_term (
    id bigint NOT NULL,
    version bigint NOT NULL,
    lookup_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    prefix character varying(255) NOT NULL
);


ALTER TABLE public.go_term OWNER TO apollo2_user;

--
-- Name: grails_user; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.grails_user (
    id bigint NOT NULL,
    version bigint NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    metadata character varying(255),
    password_hash character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    inactive boolean DEFAULT false
);


ALTER TABLE public.grails_user OWNER TO apollo2_user;

--
-- Name: grails_user_roles; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.grails_user_roles (
    role_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.grails_user_roles OWNER TO apollo2_user;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: apollo2_user
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO apollo2_user;

--
-- Name: operation; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.operation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    attributes text,
    feature_unique_name character varying(255) NOT NULL,
    new_features text,
    old_features text,
    operation_type character varying(255) NOT NULL
);


ALTER TABLE public.operation OWNER TO apollo2_user;

--
-- Name: organism; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.organism (
    id bigint NOT NULL,
    version bigint NOT NULL,
    abbreviation character varying(255),
    blatdb character varying(255),
    comment character varying(255),
    common_name character varying(255) NOT NULL,
    data_added_via_web_services boolean,
    directory character varying(255) NOT NULL,
    genus character varying(255),
    metadata character varying(255),
    non_default_translation_table character varying(255),
    public_mode boolean DEFAULT true NOT NULL,
    species character varying(255),
    valid boolean,
    genome_fasta character varying(255),
    genome_fasta_index character varying(255),
    obsolete boolean DEFAULT false
);


ALTER TABLE public.organism OWNER TO apollo2_user;

--
-- Name: organism_filter; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.organism_filter (
    id bigint NOT NULL,
    version bigint NOT NULL,
    organism_id bigint NOT NULL,
    class character varying(255) NOT NULL,
    canned_key_id bigint,
    available_status_id bigint,
    canned_comment_id bigint,
    canned_value_id bigint,
    suggested_name_id bigint
);


ALTER TABLE public.organism_filter OWNER TO apollo2_user;

--
-- Name: organism_organism_property; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.organism_organism_property (
    organism_organism_properties_id bigint,
    organism_property_id bigint
);


ALTER TABLE public.organism_organism_property OWNER TO apollo2_user;

--
-- Name: organism_property; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.organism_property (
    id bigint NOT NULL,
    version bigint NOT NULL,
    abbreviation character varying(255) NOT NULL,
    comment character varying(255) NOT NULL,
    common_name character varying(255) NOT NULL,
    genus character varying(255) NOT NULL,
    organism_id integer NOT NULL,
    species character varying(255) NOT NULL
);


ALTER TABLE public.organism_property OWNER TO apollo2_user;

--
-- Name: organism_property_organism_property; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.organism_property_organism_property (
    organism_property_organism_properties_id bigint,
    organism_property_id bigint
);


ALTER TABLE public.organism_property_organism_property OWNER TO apollo2_user;

--
-- Name: organism_property_organismdbxref; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.organism_property_organismdbxref (
    organism_property_organismdbxrefs_id bigint,
    organismdbxref_id bigint
);


ALTER TABLE public.organism_property_organismdbxref OWNER TO apollo2_user;

--
-- Name: organismdbxref; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.organismdbxref (
    id bigint NOT NULL,
    version bigint NOT NULL,
    dbxref_id bigint NOT NULL,
    organism_id bigint NOT NULL
);


ALTER TABLE public.organismdbxref OWNER TO apollo2_user;

--
-- Name: part_of; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.part_of (
    id bigint NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.part_of OWNER TO apollo2_user;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.permission (
    id bigint NOT NULL,
    version bigint NOT NULL,
    organism_id bigint NOT NULL,
    class character varying(255) NOT NULL,
    group_id bigint,
    track_visibilities character varying(255),
    permissions character varying(255),
    user_id bigint
);


ALTER TABLE public.permission OWNER TO apollo2_user;

--
-- Name: phenotype; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.phenotype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    assay_id bigint NOT NULL,
    attribute_id bigint NOT NULL,
    cvalue_id bigint NOT NULL,
    observable_id bigint NOT NULL,
    unique_name character varying(255) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.phenotype OWNER TO apollo2_user;

--
-- Name: phenotype_cvterm; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.phenotype_cvterm (
    phenotype_phenotypecvterms_id bigint,
    cvterm_id bigint
);


ALTER TABLE public.phenotype_cvterm OWNER TO apollo2_user;

--
-- Name: phenotype_description; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.phenotype_description (
    id bigint NOT NULL,
    version bigint NOT NULL,
    description character varying(255) NOT NULL,
    environment_id bigint NOT NULL,
    genotype_id bigint NOT NULL,
    publication_id bigint NOT NULL,
    type_id bigint NOT NULL
);


ALTER TABLE public.phenotype_description OWNER TO apollo2_user;

--
-- Name: phenotype_statement; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.phenotype_statement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    environment_id bigint NOT NULL,
    genotype_id bigint NOT NULL,
    phenotype_id bigint NOT NULL,
    publication_id bigint NOT NULL,
    type_id bigint NOT NULL
);


ALTER TABLE public.phenotype_statement OWNER TO apollo2_user;

--
-- Name: preference; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.preference (
    id bigint NOT NULL,
    version bigint NOT NULL,
    client_token character varying(255) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    domain character varying(255),
    last_updated timestamp without time zone NOT NULL,
    name character varying(255),
    preferences_string character varying(255),
    class character varying(255) NOT NULL,
    user_id bigint,
    current_organism boolean,
    endbp integer,
    native_track_list boolean,
    organism_id bigint,
    sequence_id bigint,
    startbp integer
);


ALTER TABLE public.preference OWNER TO apollo2_user;

--
-- Name: proxy; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.proxy (
    id bigint NOT NULL,
    version bigint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    fallback_order integer,
    last_fail timestamp without time zone,
    last_success timestamp without time zone,
    reference_url character varying(255) NOT NULL,
    target_url character varying(255) NOT NULL
);


ALTER TABLE public.proxy OWNER TO apollo2_user;

--
-- Name: publication; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.publication (
    id bigint NOT NULL,
    version bigint NOT NULL,
    is_obsolete boolean NOT NULL,
    issue character varying(255) NOT NULL,
    mini_reference character varying(255) NOT NULL,
    pages character varying(255) NOT NULL,
    publication_place character varying(255) NOT NULL,
    publication_year character varying(255) NOT NULL,
    publisher character varying(255) NOT NULL,
    series_name character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    type_id bigint NOT NULL,
    unique_name character varying(255) NOT NULL,
    volume character varying(255) NOT NULL,
    volume_title character varying(255) NOT NULL
);


ALTER TABLE public.publication OWNER TO apollo2_user;

--
-- Name: publication_author; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.publication_author (
    id bigint NOT NULL,
    version bigint NOT NULL,
    editor boolean NOT NULL,
    given_names character varying(255) NOT NULL,
    publication_id bigint NOT NULL,
    rank integer NOT NULL,
    suffix character varying(255) NOT NULL,
    surname character varying(255) NOT NULL
);


ALTER TABLE public.publication_author OWNER TO apollo2_user;

--
-- Name: publication_relationship; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.publication_relationship (
    id bigint NOT NULL,
    version bigint NOT NULL,
    object_publication_id bigint NOT NULL,
    subject_publication_id bigint NOT NULL,
    type_id bigint NOT NULL
);


ALTER TABLE public.publication_relationship OWNER TO apollo2_user;

--
-- Name: publicationdbxref; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.publicationdbxref (
    id bigint NOT NULL,
    version bigint NOT NULL,
    dbxref_id bigint NOT NULL,
    is_current boolean NOT NULL,
    publication_id bigint NOT NULL
);


ALTER TABLE public.publicationdbxref OWNER TO apollo2_user;

--
-- Name: reference; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.reference (
    id bigint NOT NULL,
    version bigint NOT NULL,
    lookup_id character varying(255) NOT NULL,
    prefix character varying(255) NOT NULL
);


ALTER TABLE public.reference OWNER TO apollo2_user;

--
-- Name: role; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL,
    rank integer
);


ALTER TABLE public.role OWNER TO apollo2_user;

--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.role_permissions (
    role_id bigint,
    permissions_string character varying(255)
);


ALTER TABLE public.role_permissions OWNER TO apollo2_user;

--
-- Name: search_tool; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.search_tool (
    id bigint NOT NULL,
    version bigint NOT NULL,
    binary_path character varying(255) NOT NULL,
    database_path character varying(255) NOT NULL,
    implementation_class character varying(255) NOT NULL,
    search_key character varying(255) NOT NULL,
    options character varying(255) NOT NULL,
    remove_temp_directory boolean NOT NULL,
    tmp_dir character varying(255) NOT NULL
);


ALTER TABLE public.search_tool OWNER TO apollo2_user;

--
-- Name: sequence; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.sequence (
    id bigint NOT NULL,
    version bigint NOT NULL,
    sequence_end integer NOT NULL,
    length integer NOT NULL,
    name character varying(255) NOT NULL,
    organism_id bigint,
    seq_chunk_size integer,
    sequence_start integer NOT NULL
);


ALTER TABLE public.sequence OWNER TO apollo2_user;

--
-- Name: sequence_cache; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.sequence_cache (
    id bigint NOT NULL,
    version bigint NOT NULL,
    feature_name character varying(255),
    fmax bigint,
    fmin bigint,
    organism_name character varying(255) NOT NULL,
    param_map text,
    response text NOT NULL,
    sequence_name text NOT NULL,
    type character varying(255)
);


ALTER TABLE public.sequence_cache OWNER TO apollo2_user;

--
-- Name: sequence_chunk; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.sequence_chunk (
    id bigint NOT NULL,
    version bigint NOT NULL,
    chunk_number integer NOT NULL,
    residue text NOT NULL,
    sequence_id bigint NOT NULL
);


ALTER TABLE public.sequence_chunk OWNER TO apollo2_user;

--
-- Name: server_data; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.server_data (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.server_data OWNER TO apollo2_user;

--
-- Name: suggested_name; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.suggested_name (
    id bigint NOT NULL,
    version bigint NOT NULL,
    metadata character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.suggested_name OWNER TO apollo2_user;

--
-- Name: suggested_name_feature_type; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.suggested_name_feature_type (
    suggested_name_feature_types_id bigint,
    feature_type_id bigint
);


ALTER TABLE public.suggested_name_feature_type OWNER TO apollo2_user;

--
-- Name: synonym; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.synonym (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.synonym OWNER TO apollo2_user;

--
-- Name: track_cache; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.track_cache (
    id bigint NOT NULL,
    version bigint NOT NULL,
    feature_name character varying(255),
    fmax bigint,
    fmin bigint,
    organism_name character varying(255) NOT NULL,
    param_map text,
    response text NOT NULL,
    sequence_name text NOT NULL,
    track_name text NOT NULL,
    type character varying(255)
);


ALTER TABLE public.track_cache OWNER TO apollo2_user;

--
-- Name: user_group; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.user_group (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL,
    public_group boolean NOT NULL,
    metadata text
);


ALTER TABLE public.user_group OWNER TO apollo2_user;

--
-- Name: user_group_admin; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.user_group_admin (
    user_id bigint NOT NULL,
    user_group_id bigint NOT NULL
);


ALTER TABLE public.user_group_admin OWNER TO apollo2_user;

--
-- Name: user_group_users; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.user_group_users (
    user_id bigint NOT NULL,
    user_group_id bigint NOT NULL
);


ALTER TABLE public.user_group_users OWNER TO apollo2_user;

--
-- Name: variant_info; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.variant_info (
    id bigint NOT NULL,
    version bigint NOT NULL,
    tag character varying(255) NOT NULL,
    value text,
    variant_id bigint NOT NULL
);


ALTER TABLE public.variant_info OWNER TO apollo2_user;

--
-- Name: with_or_from; Type: TABLE; Schema: public; Owner: apollo2_user
--

CREATE TABLE public.with_or_from (
    id bigint NOT NULL,
    version bigint NOT NULL,
    lookup_id character varying(255) NOT NULL,
    prefix character varying(255) NOT NULL
);


ALTER TABLE public.with_or_from OWNER TO apollo2_user;

--
-- Data for Name: allele; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.allele (id, version, bases, reference, variant_id) FROM stdin;
\.


--
-- Data for Name: allele_info; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.allele_info (id, version, allele_id, tag, value) FROM stdin;
\.


--
-- Data for Name: analysis; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.analysis (id, version, algorithm, description, name, program, program_version, source_name, sourceuri, source_version, time_executed) FROM stdin;
\.


--
-- Data for Name: analysis_feature; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.analysis_feature (id, version, analysis_id, feature_id, identity, normalized_score, raw_score, significance) FROM stdin;
\.


--
-- Data for Name: analysis_property; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.analysis_property (id, version, analysis_id, type_id, value) FROM stdin;
\.


--
-- Data for Name: application_preference; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.application_preference (id, version, name, value) FROM stdin;
275219	1	common_data_directory	/opt/apollo_data
\.


--
-- Data for Name: audit_log; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.audit_log (id, actor, class_name, date_created, event_name, last_updated, new_value, old_value, persisted_object_id, persisted_object_version, property_name, uri) FROM stdin;
\.


--
-- Data for Name: available_status; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.available_status (id, version, value) FROM stdin;
\.


--
-- Data for Name: available_status_feature_type; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.available_status_feature_type (available_status_feature_types_id, feature_type_id) FROM stdin;
\.


--
-- Data for Name: canned_comment; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.canned_comment (id, version, comment, metadata) FROM stdin;
\.


--
-- Data for Name: canned_comment_feature_type; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.canned_comment_feature_type (canned_comment_feature_types_id, feature_type_id) FROM stdin;
\.


--
-- Data for Name: canned_key; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.canned_key (id, version, label, metadata) FROM stdin;
\.


--
-- Data for Name: canned_key_feature_type; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.canned_key_feature_type (canned_key_feature_types_id, feature_type_id) FROM stdin;
\.


--
-- Data for Name: canned_value; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.canned_value (id, version, label, metadata) FROM stdin;
\.


--
-- Data for Name: canned_value_feature_type; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.canned_value_feature_type (canned_value_feature_types_id, feature_type_id) FROM stdin;
\.


--
-- Data for Name: custom_domain_mapping; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.custom_domain_mapping (id, version, alternate_cv_term, cv_term, is_transcript, ontology_id) FROM stdin;
\.


--
-- Data for Name: cv; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.cv (id, version, definition, name) FROM stdin;
\.


--
-- Data for Name: cvterm; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.cvterm (id, version, cv_id, dbxref_id, definition, is_obsolete, is_relationship_type, name) FROM stdin;
\.


--
-- Data for Name: cvterm_path; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.cvterm_path (id, version, cv_id, objectcvterm_id, path_distance, subjectcvterm_id, type_id) FROM stdin;
\.


--
-- Data for Name: cvterm_relationship; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.cvterm_relationship (id, version, objectcvterm_id, subjectcvterm_id, type_id) FROM stdin;
\.


--
-- Data for Name: data_adapter; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.data_adapter (id, version, export_source_genomic_sequence, feature_type_string, implementation_class, data_adapter_key, options, permission, source, temp_directory) FROM stdin;
\.


--
-- Data for Name: data_adapter_data_adapter; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.data_adapter_data_adapter (data_adapter_data_adapters_id, data_adapter_id) FROM stdin;
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase) FROM stdin;
1445460972540-1	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.784078+00	1	EXECUTED	3:22af752b59c8a786804379d0ef9a7c96	Modify data type		\N	2.0.5
1445460972540-2	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.793515+00	2	EXECUTED	3:0c7241c67fe6fdead173495f8135667c	Modify data type		\N	2.0.5
1445460972540-3	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.797513+00	3	EXECUTED	3:7da023939d667924b90829879f6e3f90	Modify data type		\N	2.0.5
1445460972540-4	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.801621+00	4	EXECUTED	3:32568584e0e7e9d168249fc6aa1fdc78	Modify data type		\N	2.0.5
1445460972540-5	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.806125+00	5	EXECUTED	3:af4137cce92f904c0b58b72062282fe6	Modify data type		\N	2.0.5
1445460972540-6	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.809978+00	6	EXECUTED	3:958e7f48d6e001950e630907bf2eb43b	Modify data type		\N	2.0.5
1445460972540-7	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.81434+00	7	EXECUTED	3:4892312d16728d0a9f7c4ab0224601ce	Modify data type		\N	2.0.5
1445460972540-8	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.818328+00	8	EXECUTED	3:b0f760c644ea0a7757cd8c891e1bd8d2	Modify data type		\N	2.0.5
1445460972540-9	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.82225+00	9	EXECUTED	3:e11a299c9debc2f5ea21621af7bb5527	Modify data type		\N	2.0.5
1445460972540-10	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.826187+00	10	EXECUTED	3:933ae34f8a303eac4b8782571189be9b	Modify data type		\N	2.0.5
1445460972540-11	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.83042+00	11	EXECUTED	3:54ae0b1800d2fc5e7878b9d23502c22c	Modify data type		\N	2.0.5
1445460972540-12	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.837186+00	12	EXECUTED	3:ea5b0a298adaa4319bceaf219247a097	Modify data type		\N	2.0.5
1445460972540-13	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.841234+00	13	EXECUTED	3:0d1c48bf959b14cd33e8e00556da1951	Modify data type		\N	2.0.5
1445460972540-14	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.845682+00	14	EXECUTED	3:7880baa527eb89987242a09f500ecf7d	Modify data type		\N	2.0.5
1445460972540-15	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.849965+00	15	EXECUTED	3:3f86e5aab029173432a1a0ab4c43e23f	Modify data type		\N	2.0.5
1445460972540-16	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.854053+00	16	EXECUTED	3:ae5beb5f944d939d89688395c8bc3f69	Modify data type		\N	2.0.5
1445460972540-17	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.857862+00	17	EXECUTED	3:0e70a7f5d594868996bd218338579fe5	Modify data type		\N	2.0.5
1445460972540-18	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.862016+00	18	EXECUTED	3:dc35fffeb59fdd0314d3162ce8830d86	Modify data type		\N	2.0.5
1445460972540-19	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.865719+00	19	EXECUTED	3:cde6cb0dae81b9ea366edc0ded82a1be	Modify data type		\N	2.0.5
1445460972540-20	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.869095+00	20	EXECUTED	3:46a0b00d358c19c65d803b4af4c4d84f	Modify data type		\N	2.0.5
1445460972540-21	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.872849+00	21	EXECUTED	3:2125d5aa7efa02682e38d2d337d9afff	Modify data type		\N	2.0.5
1445460972540-22	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.87681+00	22	EXECUTED	3:d409f1edac038a1264d030bdb314e7a9	Modify data type		\N	2.0.5
1445460972540-23	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.879994+00	23	EXECUTED	3:72eaf1247036c2e73ac28bd75a094e2a	Modify data type		\N	2.0.5
1445460972540-27	nathandunn (generated)	changelog-2_0_1.groovy	2017-09-29 18:49:41.893786+00	24	MARK_RAN	3:0b265d4077016a9e0c76e2e4ee85eac3	Drop Column (x6)		\N	2.0.5
1454711582784-1	cmdcolin (generated)	changelog-2_0_2.groovy	2017-09-29 18:49:44.32454+00	25	MARK_RAN	3:068703dfd6e640d4acb0bb4582c94ece	Create Index		\N	2.0.5
1459788030174-1	deepak.unni3	changelog-2_0_3.groovy	2017-09-29 18:49:44.330672+00	26	EXECUTED	3:78cbe7c731bcba5bf30fbc5ea4cc4380	Modify data type		\N	2.0.5
1459788030174-2	nathandunn	changelog-2_0_3.groovy	2017-09-29 18:49:44.338014+00	27	MARK_RAN	3:b3ba6222b0538395d928e653026856ce	Add Column (x3), Add Not-Null Constraint		\N	2.0.5
1459788030175-1	nathandunn	changelog-2_0_7.groovy	2017-09-29 18:49:44.342935+00	28	EXECUTED	3:7254ad4b135e6906f3b56fddf436853e	Delete Data		\N	2.0.5
1459788030176-1	deepak.unni3	changelog-2_0_8.groovy	2017-10-30 16:19:10.691051+00	29	EXECUTED	3:355d86cb6d6791df4f13ee62b4c49139	Drop Not-Null Constraint		\N	2.0.5
1459788030177-1	nathandunn	changelog-2_0_9.groovy	2019-05-22 17:35:49.261745+00	30	MARK_RAN	3:14e435a1ca31685020b9aecb9dd2cdfa	Add Column (x2)		\N	2.0.5
1459788030178-1	nathandunn	changelog-2_3_1.groovy	2019-05-22 17:35:49.298164+00	31	EXECUTED	3:bd0d5968dcc35876cec708b578bb6a03	Add Column		\N	2.0.5
1459788030178-2	nathandunn	changelog-2_3_1.groovy	2019-05-22 17:35:49.322813+00	32	EXECUTED	3:8e672295dc34be575819e54b5dbc5049	Add Column		\N	2.0.5
1459788030178-1	nathandunn	changelog-2_4_0.groovy	2019-05-22 17:35:49.328029+00	33	MARK_RAN	3:78c5ca1179a59d7bdb5a0aaad84028b6	Create Table		\N	2.0.5
1459788030178-2	nathandunn	changelog-2_4_0.groovy	2019-05-22 17:35:49.331549+00	34	EXECUTED	3:b16c9f27ec3323d6ab7a38eba10591df	Drop Not-Null Constraint		\N	2.0.5
1459788030180-1	nathandunn	changelog-2_6_0.groovy	2020-01-22 23:44:38.451867+00	35	EXECUTED	3:cd71fa86f08a4f42f669ef4ca07e54c2	Drop Column (x2)		\N	2.0.5
1459788030180-2	nathandunn	changelog-2_6_0.groovy	2020-01-22 23:44:38.470868+00	36	EXECUTED	3:51553c12e24018628253f4fbe51ac401	Drop Not-Null Constraint (x3)		\N	2.0.5
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: db; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.db (id, version, description, name, url, url_prefix) FROM stdin;
\.


--
-- Data for Name: dbxref; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.dbxref (id, version, accession, db_id, description) FROM stdin;
\.


--
-- Data for Name: dbxref_property; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.dbxref_property (id, version, dbxref_id, rank, type_id, value) FROM stdin;
\.


--
-- Data for Name: environment; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.environment (id, version, description, uniquename) FROM stdin;
\.


--
-- Data for Name: environmentcvterm; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.environmentcvterm (id, version, cvterm_id, environment_id) FROM stdin;
\.


--
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature (id, version, date_created, dbxref_id, description, is_analysis, is_obsolete, last_updated, md5checksum, name, sequence_length, status_id, symbol, unique_name, class, analysis_feature_id, alternate_cv_term, class_name, custom_alternate_cv_term, custom_class_name, custom_cv_term, custom_ontology_id, cv_term, meta_data, ontology_id, alteration_residue, deletion_length, reference_allele_id) FROM stdin;
\.


--
-- Data for Name: feature_dbxref; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_dbxref (feature_featuredbxrefs_id, dbxref_id) FROM stdin;
\.


--
-- Data for Name: feature_event; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_event (id, version, child_id, child_split_id, current, date_created, editor_id, last_updated, name, new_features_json_array, old_features_json_array, operation, original_json_command, parent_id, parent_merge_id, unique_name) FROM stdin;
\.


--
-- Data for Name: feature_feature_phenotypes; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_feature_phenotypes (feature_id, phenotype_id) FROM stdin;
\.


--
-- Data for Name: feature_genotype; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_genotype (id, version, cgroup, chromosome_feature_id, cvterm_id, feature_id, feature_genotype_id, genotype_id, rank) FROM stdin;
\.


--
-- Data for Name: feature_grails_user; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_grails_user (feature_owners_id, user_id) FROM stdin;
\.


--
-- Data for Name: feature_location; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_location (id, version, feature_id, fmax, fmin, is_fmax_partial, is_fmin_partial, locgroup, phase, rank, residue_info, sequence_id, strand) FROM stdin;
\.


--
-- Data for Name: feature_location_publication; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_location_publication (feature_location_feature_location_publications_id, publication_id) FROM stdin;
\.


--
-- Data for Name: feature_property; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_property (id, version, feature_id, rank, tag, type_id, value, class) FROM stdin;
\.


--
-- Data for Name: feature_property_publication; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_property_publication (feature_property_feature_property_publications_id, publication_id) FROM stdin;
\.


--
-- Data for Name: feature_publication; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_publication (feature_feature_publications_id, publication_id) FROM stdin;
\.


--
-- Data for Name: feature_relationship; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_relationship (id, version, child_feature_id, parent_feature_id, rank, value) FROM stdin;
\.


--
-- Data for Name: feature_relationship_feature_property; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_relationship_feature_property (feature_relationship_feature_relationship_properties_id, feature_property_id) FROM stdin;
\.


--
-- Data for Name: feature_relationship_publication; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_relationship_publication (feature_relationship_feature_relationship_publications_id, publication_id) FROM stdin;
\.


--
-- Data for Name: feature_synonym; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_synonym (id, version, feature_id, is_current, is_internal, publication_id, synonym_id, feature_synonyms_id) FROM stdin;
\.


--
-- Data for Name: feature_type; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.feature_type (id, version, display, name, ontology_id, type) FROM stdin;
5	0	Gene	Gene	SO:0000704	sequence
6	0	Pseudogene	Pseudogene	SO:0000336	sequence
7	0	Transcript	Transcript	SO:0000673	sequence
8	0	mRNA	MRNA	SO:0000234	sequence
9	0	snRNA	SnRNA	SO:0000274	sequence
10	0	snoRNA	SnoRNA	SO:0000275	sequence
11	0	miRNA	MiRNA	SO:0000276	sequence
12	0	tRNA	TRNA	SO:0000253	sequence
13	0	ncRNA	NcRNA	SO:0000655	sequence
14	0	rRNA	RRNA	SO:0000252	sequence
15	0	repeat_region	RepeatRegion	SO:0000657	sequence
16	0	transposable_element	TransposableElement	SO:0000101	sequence
\.


--
-- Data for Name: featurecvterm; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.featurecvterm (id, version, cvterm_id, feature_id, is_not, publication_id, rank) FROM stdin;
\.


--
-- Data for Name: featurecvterm_dbxref; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.featurecvterm_dbxref (featurecvterm_featurecvtermdbxrefs_id, dbxref_id) FROM stdin;
\.


--
-- Data for Name: featurecvterm_publication; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.featurecvterm_publication (featurecvterm_featurecvterm_publications_id, publication_id) FROM stdin;
\.


--
-- Data for Name: genotype; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.genotype (id, version, description, genotype_id, name, unique_name) FROM stdin;
\.


--
-- Data for Name: go_annotation; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.go_annotation (id, version, aspect, date_created, evidence_ref, feature_id, gene_product_relationship_ref, go_ref, last_updated, negate, notes_array, reference, with_or_from_array, evidence_ref_label, go_ref_label) FROM stdin;
\.


--
-- Data for Name: go_annotation_grails_user; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.go_annotation_grails_user (go_annotation_owners_id, user_id) FROM stdin;
\.


--
-- Data for Name: go_term; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.go_term (id, version, lookup_id, name, prefix) FROM stdin;
\.


--
-- Data for Name: grails_user; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.grails_user (id, version, first_name, last_name, metadata, password_hash, username, inactive) FROM stdin;
19	1	Nathan	Dunn	\N	dc7bab77cb868f6da7ec89ec81acb4ed2b609b8f3b0d5cf12146a51363139a50	nathandunn@lbl.gov	f
1083	1	Deepak	Unni	\N	2a08132728ab0958f23149a8e3eff7538b922f856832b8165d15b9359dcaacc5	deepak.unni3@gmail.com	f
1084	1	Scott	Cain	\N	2a08132728ab0958f23149a8e3eff7538b922f856832b8165d15b9359dcaacc5	scott@scottcain.net	f
1085	1	Suzi	Lewis	\N	2a08132728ab0958f23149a8e3eff7538b922f856832b8165d15b9359dcaacc5	selewis@lbl.gov	f
\.


--
-- Data for Name: grails_user_roles; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.grails_user_roles (role_id, user_id) FROM stdin;
18	19
18	1083
18	1084
18	1085
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: apollo2_user
--

SELECT pg_catalog.setval('public.hibernate_sequence', 920911, true);


--
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.operation (id, version, attributes, feature_unique_name, new_features, old_features, operation_type) FROM stdin;
\.


--
-- Data for Name: organism; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.organism (id, version, abbreviation, blatdb, comment, common_name, data_added_via_web_services, directory, genus, metadata, non_default_translation_table, public_mode, species, valid, genome_fasta, genome_fasta_index, obsolete) FROM stdin;
918618	3	\N	\N	\N	human	\N	/jbrowse/apollo/data/human	Homo	{"creator":"19"}	\N	t	sapiens	t	\N	\N	f
773738	6	\N	\N	\N	worm	\N	/jbrowse/apollo/data/worm	Caenorhabditis	{"creator":"19"}	\N	t	elegans	t	\N	\N	f
918592	4	\N	\N	\N	rat	\N	/jbrowse/apollo/data/RGD	Rattus	{"creator":"19"}	\N	t	norvegicus	t	\N	\N	f
918567	4	\N	\N	\N	mouse	\N	/jbrowse/apollo/data/MGI	Mus	{"creator":"19"}	\N	t	musculus	t	\N	\N	f
918450	6	\N	\N	\N	yeast	\N	/jbrowse/apollo/data/yeast	Saccharomyces	{"creator":"19"}	\N	t	cerevisiae	t	\N	\N	f
918487	6	\N	\N	\N	zebrafish	\N	/jbrowse/apollo/data/zebrafish	Danio	{"creator":"19"}	\N	t	rerio	t	\N	\N	f
1095	6	\N	\N	\N	fly	\N	/jbrowse/apollo/data/fly	Drosophila	\N	\N	t	melanogaster	t	\N	\N	f
920915	2	\N	\N	\N	SARS-CoV-2	\N	/jbrowse/apollo/data/SARS-CoV-2	Coronavirus	{"creator":"920912"}	\N	t	SARS-CoV-2	t	\N	\N	f
\.


--
-- Data for Name: organism_filter; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.organism_filter (id, version, organism_id, class, canned_key_id, available_status_id, canned_comment_id, canned_value_id, suggested_name_id) FROM stdin;
\.


--
-- Data for Name: organism_organism_property; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.organism_organism_property (organism_organism_properties_id, organism_property_id) FROM stdin;
\.


--
-- Data for Name: organism_property; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.organism_property (id, version, abbreviation, comment, common_name, genus, organism_id, species) FROM stdin;
\.


--
-- Data for Name: organism_property_organism_property; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.organism_property_organism_property (organism_property_organism_properties_id, organism_property_id) FROM stdin;
\.


--
-- Data for Name: organism_property_organismdbxref; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.organism_property_organismdbxref (organism_property_organismdbxrefs_id, organismdbxref_id) FROM stdin;
\.


--
-- Data for Name: organismdbxref; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.organismdbxref (id, version, dbxref_id, organism_id) FROM stdin;
\.


--
-- Data for Name: part_of; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.part_of (id, version) FROM stdin;
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.permission (id, version, organism_id, class, group_id, track_visibilities, permissions, user_id) FROM stdin;
773739	1	773738	org.bbop.apollo.UserOrganismPermission	\N	\N	["ADMINISTRATE"]	19
918451	1	918450	org.bbop.apollo.UserOrganismPermission	\N	\N	["ADMINISTRATE"]	19
918488	1	918487	org.bbop.apollo.UserOrganismPermission	\N	\N	["ADMINISTRATE"]	19
918568	1	918567	org.bbop.apollo.UserOrganismPermission	\N	\N	["ADMINISTRATE"]	19
918593	1	918592	org.bbop.apollo.UserOrganismPermission	\N	\N	["ADMINISTRATE"]	19
918619	1	918618	org.bbop.apollo.UserOrganismPermission	\N	\N	["ADMINISTRATE"]	19
918647	1	918646	org.bbop.apollo.UserOrganismPermission	\N	\N	["ADMINISTRATE"]	19
920916	1	920915	org.bbop.apollo.UserOrganismPermission	\N	\N	["ADMINISTRATE"]	920912
\.


--
-- Data for Name: phenotype; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.phenotype (id, version, assay_id, attribute_id, cvalue_id, observable_id, unique_name, value) FROM stdin;
\.


--
-- Data for Name: phenotype_cvterm; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.phenotype_cvterm (phenotype_phenotypecvterms_id, cvterm_id) FROM stdin;
\.


--
-- Data for Name: phenotype_description; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.phenotype_description (id, version, description, environment_id, genotype_id, publication_id, type_id) FROM stdin;
\.


--
-- Data for Name: phenotype_statement; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.phenotype_statement (id, version, environment_id, genotype_id, phenotype_id, publication_id, type_id) FROM stdin;
\.


--
-- Data for Name: preference; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.preference (id, version, client_token, date_created, domain, last_updated, name, preferences_string, class, user_id, current_organism, endbp, native_track_list, organism_id, sequence_id, startbp) FROM stdin;
918673	0	78279833310241853061209735067	2020-01-22 23:20:48.124	\N	2020-01-22 23:20:48.124	\N	\N	org.bbop.apollo.UserOrganismPreference	19	t	32079331	f	918646	918651	0
918645	0	78279833310241853061209735067	2020-01-22 23:19:56.078	\N	2020-01-22 23:19:56.078	\N	\N	org.bbop.apollo.UserOrganismPreference	19	f	248956422	f	918618	918620	0
918617	0	78279833310241853061209735067	2020-01-22 23:19:33.8	\N	2020-01-22 23:19:33.8	\N	\N	org.bbop.apollo.UserOrganismPreference	19	f	282763074	f	918592	918594	0
918591	0	78279833310241853061209735067	2020-01-22 23:19:20.276	\N	2020-01-22 23:19:20.276	\N	\N	org.bbop.apollo.UserOrganismPreference	19	f	195471971	f	918567	918569	0
1082	1	2774466419181544061716143817	2017-09-29 18:51:43.716	\N	2017-09-29 18:51:45.663	\N	\N	org.bbop.apollo.UserOrganismPreference	19	f	76625712	f	20	40	0
1148	1	2774466419181544061716143817	2017-09-29 18:54:42.057	\N	2017-09-29 18:54:43.232	\N	\N	org.bbop.apollo.UserOrganismPreference	19	f	248956422	f	1122	1123	0
1172	1	2774466419181544061716143817	2017-09-29 18:55:22.864	\N	2017-09-29 18:55:24.217	\N	\N	org.bbop.apollo.UserOrganismPreference	19	f	195471971	f	1149	1150	0
773756	2	6101505013304254071535961579	2019-10-25 20:59:47.792	\N	2019-10-25 20:59:47.934	\N	\N	org.bbop.apollo.UserOrganismPreference	19	f	20924180	f	773738	773753	0
1197	1	2774466419181544061716143817	2017-09-29 18:56:02.942	\N	2017-09-29 18:56:04.085	\N	\N	org.bbop.apollo.UserOrganismPreference	19	f	282763074	f	1173	1174	0
1216	1	2774466419181544061716143817	2017-09-29 18:56:49.815	\N	2017-09-29 18:56:51.743	\N	\N	org.bbop.apollo.UserOrganismPreference	19	f	1531933	f	1198	1202	0
\.


--
-- Data for Name: proxy; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.proxy (id, version, active, fallback_order, last_fail, last_success, reference_url, target_url) FROM stdin;
3	0	f	1	\N	\N	http://golr.geneontology.org/select	http://golr.berkeleybop.org/select
4	0	f	2	\N	\N	http://golr.geneontology.org/select	http://golr.berkeleybop.org/solr/select
274960	0	t	0	\N	\N	http://golr.geneontology.org/select	http://golr.geneontology.org/solr/select
\.


--
-- Data for Name: publication; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.publication (id, version, is_obsolete, issue, mini_reference, pages, publication_place, publication_year, publisher, series_name, title, type_id, unique_name, volume, volume_title) FROM stdin;
\.


--
-- Data for Name: publication_author; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.publication_author (id, version, editor, given_names, publication_id, rank, suffix, surname) FROM stdin;
\.


--
-- Data for Name: publication_relationship; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.publication_relationship (id, version, object_publication_id, subject_publication_id, type_id) FROM stdin;
\.


--
-- Data for Name: publicationdbxref; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.publicationdbxref (id, version, dbxref_id, is_current, publication_id) FROM stdin;
\.


--
-- Data for Name: reference; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.reference (id, version, lookup_id, prefix) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.role (id, version, name, rank) FROM stdin;
17	2	USER	10
274961	1	INSTRUCTOR	50
18	6	ADMIN	100
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.role_permissions (role_id, permissions_string) FROM stdin;
17	*:*
18	*:*
274961	*:*
\.


--
-- Data for Name: search_tool; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.search_tool (id, version, binary_path, database_path, implementation_class, search_key, options, remove_temp_directory, tmp_dir) FROM stdin;
\.


--
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.sequence (id, version, sequence_end, length, name, organism_id, seq_chunk_size, sequence_start) FROM stdin;
773749	0	15072434	15072434	I	773738	80000	0
773750	0	15279421	15279421	II	773738	80000	0
773751	0	13783801	13783801	III	773738	80000	0
773752	0	17493829	17493829	IV	773738	80000	0
773753	0	20924180	20924180	V	773738	80000	0
773754	0	17718942	17718942	X	773738	80000	0
773755	0	13794	13794	MtDNA	773738	80000	0
918406	0	15072434	15072434	I	1086	80000	0
918407	0	15279421	15279421	II	1086	80000	0
918408	0	13783801	13783801	III	1086	80000	0
918409	0	17493829	17493829	IV	1086	80000	0
918410	0	20924180	20924180	V	1086	80000	0
918411	0	17718942	17718942	X	1086	80000	0
918412	0	13794	13794	MtDNA	1086	80000	0
918470	0	230218	230218	chrI	918450	80000	0
918471	0	813184	813184	chrII	918450	80000	0
918472	0	316620	316620	chrIII	918450	80000	0
918473	0	1531933	1531933	chrIV	918450	80000	0
918474	0	439888	439888	chrIX	918450	80000	0
918475	0	576874	576874	chrV	918450	80000	0
918476	0	270161	270161	chrVI	918450	80000	0
918477	0	1090940	1090940	chrVII	918450	80000	0
918478	0	562643	562643	chrVIII	918450	80000	0
918479	0	745751	745751	chrX	918450	80000	0
918480	0	666816	666816	chrXI	918450	80000	0
918481	0	1078177	1078177	chrXII	918450	80000	0
918482	0	924431	924431	chrXIII	918450	80000	0
918483	0	784333	784333	chrXIV	918450	80000	0
918484	0	1091291	1091291	chrXV	918450	80000	0
918485	0	948066	948066	chrXVI	918450	80000	0
918486	0	85779	85779	chrmt	918450	80000	0
918516	0	59578282	59578282	1	918487	80000	0
918517	0	45420867	45420867	10	918487	80000	0
918518	0	45484837	45484837	11	918487	80000	0
918519	0	49182954	49182954	12	918487	80000	0
918520	0	52186027	52186027	13	918487	80000	0
918521	0	52660232	52660232	14	918487	80000	0
918522	0	48040578	48040578	15	918487	80000	0
918523	0	55266484	55266484	16	918487	80000	0
918524	0	53461100	53461100	17	918487	80000	0
918525	0	51023478	51023478	18	918487	80000	0
918526	0	48449771	48449771	19	918487	80000	0
918527	0	59640629	59640629	2	918487	80000	0
918528	0	55201332	55201332	20	918487	80000	0
918529	0	45934066	45934066	21	918487	80000	0
918530	0	39133080	39133080	22	918487	80000	0
918531	0	46223584	46223584	23	918487	80000	0
918532	0	42172926	42172926	24	918487	80000	0
918533	0	37502051	37502051	25	918487	80000	0
918534	0	62628489	62628489	3	918487	80000	0
918535	0	78093715	78093715	4	918487	80000	0
918536	0	72500376	72500376	5	918487	80000	0
918537	0	60270059	60270059	6	918487	80000	0
918538	0	74282399	74282399	7	918487	80000	0
918539	0	54304671	54304671	8	918487	80000	0
918540	0	56459846	56459846	9	918487	80000	0
918541	0	16596	16596	MT	918487	80000	0
918542	0	23513712	23513712	2L	1095	80000	0
918543	0	25286936	25286936	2R	1095	80000	0
918544	0	28110227	28110227	3L	1095	80000	0
918545	0	32079331	32079331	3R	1095	80000	0
918546	0	1348131	1348131	4	1095	80000	0
918547	0	23542271	23542271	X	1095	80000	0
918548	0	3667352	3667352	Y	1095	80000	0
918549	0	19524	19524	mitochondrion_genome	1095	80000	0
918550	0	76973	76973	rDNA	1095	80000	0
918551	0	12714	12714	211000022278279	1095	80000	0
918552	0	2815	2815	211000022278436	1095	80000	0
918553	0	1947	1947	211000022278449	1095	80000	0
918554	0	1144	1144	211000022278760	1095	80000	0
918555	0	1118	1118	211000022279165	1095	80000	0
918556	0	3347	3347	211000022279188	1095	80000	0
918557	0	1019	1019	211000022279264	1095	80000	0
918558	0	1356	1356	211000022279392	1095	80000	0
918559	0	11763	11763	211000022279681	1095	80000	0
918560	0	14098	14098	211000022280328	1095	80000	0
918561	0	1371	1371	211000022280341	1095	80000	0
918562	0	1870	1870	211000022280347	1095	80000	0
918563	0	3713	3713	211000022280481	1095	80000	0
918564	0	4197	4197	211000022280494	1095	80000	0
918565	0	3906	3906	211000022280703	1095	80000	0
918566	0	88768	88768	Unmapped_Scaffold_8_D1580_D1567	1095	80000	0
918569	0	195471971	195471971	1	918567	80000	0
918570	0	182113224	182113224	2	918567	80000	0
918571	0	160039680	160039680	3	918567	80000	0
918572	0	156508116	156508116	4	918567	80000	0
918573	0	151834684	151834684	5	918567	80000	0
918574	0	149736546	149736546	6	918567	80000	0
918575	0	145441459	145441459	7	918567	80000	0
918576	0	129401213	129401213	8	918567	80000	0
918577	0	124595110	124595110	9	918567	80000	0
918578	0	130694993	130694993	10	918567	80000	0
918579	0	122082543	122082543	11	918567	80000	0
918580	0	120129022	120129022	12	918567	80000	0
918581	0	120421639	120421639	13	918567	80000	0
918582	0	124902244	124902244	14	918567	80000	0
918583	0	104043685	104043685	15	918567	80000	0
918584	0	98207768	98207768	16	918567	80000	0
918585	0	94987271	94987271	17	918567	80000	0
918586	0	90702639	90702639	18	918567	80000	0
918587	0	61431566	61431566	19	918567	80000	0
918588	0	171031299	171031299	X	918567	80000	0
918589	0	91744698	91744698	Y	918567	80000	0
918590	0	16299	16299	MT	918567	80000	0
918594	0	282763074	282763074	1	918592	80000	0
918595	0	266435125	266435125	2	918592	80000	0
918596	0	177699992	177699992	3	918592	80000	0
918597	0	184226339	184226339	4	918592	80000	0
918598	0	173707219	173707219	5	918592	80000	0
918599	0	147991367	147991367	6	918592	80000	0
918600	0	145729302	145729302	7	918592	80000	0
918601	0	133307652	133307652	8	918592	80000	0
918602	0	122095297	122095297	9	918592	80000	0
918603	0	112626471	112626471	10	918592	80000	0
918604	0	90463843	90463843	11	918592	80000	0
918605	0	52716770	52716770	12	918592	80000	0
918606	0	114033958	114033958	13	918592	80000	0
918607	0	115493446	115493446	14	918592	80000	0
918608	0	111246239	111246239	15	918592	80000	0
918609	0	90668790	90668790	16	918592	80000	0
918610	0	90843779	90843779	17	918592	80000	0
918611	0	88201929	88201929	18	918592	80000	0
918612	0	62275575	62275575	19	918592	80000	0
918613	0	56205956	56205956	20	918592	80000	0
918614	0	159970021	159970021	X	918592	80000	0
918615	0	3310458	3310458	Y	918592	80000	0
918616	0	16313	16313	MT	918592	80000	0
918620	0	248956422	248956422	1	918618	80000	0
918621	0	242193529	242193529	2	918618	80000	0
918622	0	198295559	198295559	3	918618	80000	0
918623	0	190214555	190214555	4	918618	80000	0
918624	0	181538259	181538259	5	918618	80000	0
918625	0	170805979	170805979	6	918618	80000	0
918626	0	159345973	159345973	7	918618	80000	0
918627	0	145138636	145138636	8	918618	80000	0
918628	0	138394717	138394717	9	918618	80000	0
918629	0	133797422	133797422	10	918618	80000	0
918630	0	135086622	135086622	11	918618	80000	0
918631	0	133275309	133275309	12	918618	80000	0
918632	0	114364328	114364328	13	918618	80000	0
918633	0	107043718	107043718	14	918618	80000	0
918634	0	101991189	101991189	15	918618	80000	0
918635	0	90338345	90338345	16	918618	80000	0
918636	0	83257441	83257441	17	918618	80000	0
918637	0	80373285	80373285	18	918618	80000	0
918638	0	58617616	58617616	19	918618	80000	0
918639	0	64444167	64444167	20	918618	80000	0
918640	0	46709983	46709983	21	918618	80000	0
918641	0	50818468	50818468	22	918618	80000	0
918642	0	156040895	156040895	X	918618	80000	0
918643	0	57227415	57227415	Y	918618	80000	0
918644	0	16571	16571	MT	918618	80000	0
918648	0	23513712	23513712	2L	918646	80000	0
918649	0	25286936	25286936	2R	918646	80000	0
918650	0	28110227	28110227	3L	918646	80000	0
918651	0	32079331	32079331	3R	918646	80000	0
918652	0	1348131	1348131	4	918646	80000	0
918653	0	23542271	23542271	X	918646	80000	0
918654	0	3667352	3667352	Y	918646	80000	0
918655	0	19524	19524	mitochondrion_genome	918646	80000	0
918656	0	76973	76973	rDNA	918646	80000	0
918657	0	12714	12714	211000022278279	918646	80000	0
918658	0	2815	2815	211000022278436	918646	80000	0
918659	0	1947	1947	211000022278449	918646	80000	0
918660	0	1144	1144	211000022278760	918646	80000	0
918661	0	1118	1118	211000022279165	918646	80000	0
918662	0	3347	3347	211000022279188	918646	80000	0
918663	0	1019	1019	211000022279264	918646	80000	0
918664	0	1356	1356	211000022279392	918646	80000	0
918665	0	11763	11763	211000022279681	918646	80000	0
918666	0	14098	14098	211000022280328	918646	80000	0
918667	0	1371	1371	211000022280341	918646	80000	0
918668	0	1870	1870	211000022280347	918646	80000	0
918669	0	3713	3713	211000022280481	918646	80000	0
918670	0	4197	4197	211000022280494	918646	80000	0
918671	0	3906	3906	211000022280703	918646	80000	0
918672	0	88768	88768	Unmapped_Scaffold_8_D1580_D1567	918646	80000	0
21	0	58871917	58871917	1	20	80000	0
22	0	45574255	45574255	10	20	80000	0
23	0	45107271	45107271	11	20	80000	0
24	0	49229541	49229541	12	20	80000	0
25	0	51780250	51780250	13	20	80000	0
26	0	51944548	51944548	14	20	80000	0
27	0	47771147	47771147	15	20	80000	0
28	0	55381981	55381981	16	20	80000	0
29	0	53345113	53345113	17	20	80000	0
30	0	51008593	51008593	18	20	80000	0
31	0	48790377	48790377	19	20	80000	0
32	0	59543403	59543403	2	20	80000	0
33	0	55370968	55370968	20	20	80000	0
34	0	45895719	45895719	21	20	80000	0
35	0	39226288	39226288	22	20	80000	0
36	0	46272358	46272358	23	20	80000	0
37	0	42251103	42251103	24	20	80000	0
38	0	36898761	36898761	25	20	80000	0
39	0	62385949	62385949	3	20	80000	0
40	0	76625712	76625712	4	20	80000	0
41	0	71715914	71715914	5	20	80000	0
42	0	60272633	60272633	6	20	80000	0
43	0	74082188	74082188	7	20	80000	0
44	0	54191831	54191831	8	20	80000	0
45	0	56892771	56892771	9	20	80000	0
46	0	35552	35552	KN149679.1	20	80000	0
47	0	38724	38724	KN149680.1	20	80000	0
48	0	107758	107758	KN149681.1	20	80000	0
49	0	137468	137468	KN149682.1	20	80000	0
50	0	152860	152860	KN149683.1	20	80000	0
51	0	159057	159057	KN149684.1	20	80000	0
52	0	164780	164780	KN149685.1	20	80000	0
53	0	260365	260365	KN149686.1	20	80000	0
54	0	165668	165668	KN149687.1	20	80000	0
55	0	252705	252705	KN149688.1	20	80000	0
56	0	196689	196689	KN149689.1	20	80000	0
57	0	343018	343018	KN149690.1	20	80000	0
58	0	233193	233193	KN149691.1	20	80000	0
59	0	36911	36911	KN149692.1	20	80000	0
60	0	49295	49295	KN149693.1	20	80000	0
61	0	162759	162759	KN149694.1	20	80000	0
62	0	190731	190731	KN149695.1	20	80000	0
63	0	368637	368637	KN149696.1	20	80000	0
64	0	40969	40969	KN149697.1	20	80000	0
65	0	108577	108577	KN149698.1	20	80000	0
66	0	33146	33146	KN149699.1	20	80000	0
67	0	40050	40050	KN149700.1	20	80000	0
68	0	3760	3760	KN149701.1	20	80000	0
69	0	100325	100325	KN149702.1	20	80000	0
70	0	13902	13902	KN149703.1	20	80000	0
71	0	48089	48089	KN149704.1	20	80000	0
72	0	27926	27926	KN149705.1	20	80000	0
73	0	33279	33279	KN149706.1	20	80000	0
74	0	6001	6001	KN149707.1	20	80000	0
75	0	20567	20567	KN149708.1	20	80000	0
76	0	27814	27814	KN149709.1	20	80000	0
77	0	50974	50974	KN149710.1	20	80000	0
78	0	11473	11473	KN149711.1	20	80000	0
79	0	1115	1115	KN149712.1	20	80000	0
80	0	10094	10094	KN149713.1	20	80000	0
81	0	74622	74622	KN149714.1	20	80000	0
82	0	19020	19020	KN149715.1	20	80000	0
83	0	42229	42229	KN149716.1	20	80000	0
84	0	47589	47589	KN149717.1	20	80000	0
85	0	65247	65247	KN149718.1	20	80000	0
86	0	47531	47531	KN149719.1	20	80000	0
87	0	10211	10211	KN149720.1	20	80000	0
88	0	25462	25462	KN149721.1	20	80000	0
89	0	13397	13397	KN149722.1	20	80000	0
90	0	55784	55784	KN149723.1	20	80000	0
91	0	11849	11849	KN149724.1	20	80000	0
92	0	69829	69829	KN149725.1	20	80000	0
93	0	2146	2146	KN149726.1	20	80000	0
94	0	24871	24871	KN149727.1	20	80000	0
95	0	9442	9442	KN149728.1	20	80000	0
96	0	5608	5608	KN149729.1	20	80000	0
97	0	14804	14804	KN149730.1	20	80000	0
98	0	19431	19431	KN149731.1	20	80000	0
99	0	16041	16041	KN149732.1	20	80000	0
100	0	21637	21637	KN149733.1	20	80000	0
101	0	6288	6288	KN149734.1	20	80000	0
102	0	5747	5747	KN149735.1	20	80000	0
103	0	1649	1649	KN149736.1	20	80000	0
104	0	27700	27700	KN149737.1	20	80000	0
105	0	10603	10603	KN149738.1	20	80000	0
106	0	51610	51610	KN149739.1	20	80000	0
107	0	1265	1265	KN149740.1	20	80000	0
108	0	21941	21941	KN149741.1	20	80000	0
109	0	2671	2671	KN149742.1	20	80000	0
110	0	21023	21023	KN149743.1	20	80000	0
111	0	19164	19164	KN149744.1	20	80000	0
112	0	8150	8150	KN149745.1	20	80000	0
113	0	10900	10900	KN149746.1	20	80000	0
114	0	16275	16275	KN149747.1	20	80000	0
115	0	96570	96570	KN149748.1	20	80000	0
116	0	40089	40089	KN149749.1	20	80000	0
117	0	13928	13928	KN149750.1	20	80000	0
118	0	15848	15848	KN149751.1	20	80000	0
119	0	16628	16628	KN149752.1	20	80000	0
120	0	30249	30249	KN149753.1	20	80000	0
121	0	40214	40214	KN149754.1	20	80000	0
122	0	11941	11941	KN149755.1	20	80000	0
123	0	11785	11785	KN149756.1	20	80000	0
124	0	16145	16145	KN149757.1	20	80000	0
125	0	9515	9515	KN149758.1	20	80000	0
126	0	38290	38290	KN149759.1	20	80000	0
127	0	46605	46605	KN149760.1	20	80000	0
128	0	14795	14795	KN149761.1	20	80000	0
129	0	17936	17936	KN149762.1	20	80000	0
130	0	19644	19644	KN149763.1	20	80000	0
131	0	19831	19831	KN149764.1	20	80000	0
132	0	29197	29197	KN149765.1	20	80000	0
133	0	14664	14664	KN149766.1	20	80000	0
134	0	30874	30874	KN149767.1	20	80000	0
135	0	17671	17671	KN149768.1	20	80000	0
136	0	53048	53048	KN149769.1	20	80000	0
137	0	12046	12046	KN149770.1	20	80000	0
138	0	14151	14151	KN149771.1	20	80000	0
139	0	13273	13273	KN149772.1	20	80000	0
140	0	1302	1302	KN149773.1	20	80000	0
141	0	12337	12337	KN149774.1	20	80000	0
142	0	18776	18776	KN149775.1	20	80000	0
143	0	2919	2919	KN149776.1	20	80000	0
144	0	1553	1553	KN149777.1	20	80000	0
145	0	111598	111598	KN149778.1	20	80000	0
146	0	21664	21664	KN149779.1	20	80000	0
147	0	19718	19718	KN149780.1	20	80000	0
148	0	9962	9962	KN149781.1	20	80000	0
149	0	36097	36097	KN149782.1	20	80000	0
150	0	11892	11892	KN149783.1	20	80000	0
151	0	73829	73829	KN149784.1	20	80000	0
152	0	1577	1577	KN149785.1	20	80000	0
153	0	1745	1745	KN149786.1	20	80000	0
154	0	39794	39794	KN149787.1	20	80000	0
155	0	8794	8794	KN149788.1	20	80000	0
156	0	12990	12990	KN149789.1	20	80000	0
157	0	115850	115850	KN149790.1	20	80000	0
158	0	17273	17273	KN149791.1	20	80000	0
159	0	11232	11232	KN149792.1	20	80000	0
160	0	13298	13298	KN149793.1	20	80000	0
161	0	25440	25440	KN149794.1	20	80000	0
162	0	34615	34615	KN149795.1	20	80000	0
163	0	25635	25635	KN149796.1	20	80000	0
164	0	102101	102101	KN149797.1	20	80000	0
165	0	1990	1990	KN149798.1	20	80000	0
166	0	27060	27060	KN149799.1	20	80000	0
167	0	42049	42049	KN149800.1	20	80000	0
168	0	4454	4454	KN149801.1	20	80000	0
169	0	3818	3818	KN149802.1	20	80000	0
170	0	16018	16018	KN149803.1	20	80000	0
171	0	10148	10148	KN149804.1	20	80000	0
172	0	12432	12432	KN149805.1	20	80000	0
173	0	15157	15157	KN149806.1	20	80000	0
174	0	12512	12512	KN149807.1	20	80000	0
175	0	15454	15454	KN149808.1	20	80000	0
176	0	2001	2001	KN149809.1	20	80000	0
177	0	15043	15043	KN149810.1	20	80000	0
178	0	8720	8720	KN149811.1	20	80000	0
179	0	51419	51419	KN149812.1	20	80000	0
180	0	59009	59009	KN149813.1	20	80000	0
181	0	25878	25878	KN149814.1	20	80000	0
182	0	33337	33337	KN149815.1	20	80000	0
183	0	10128	10128	KN149816.1	20	80000	0
184	0	11116	11116	KN149817.1	20	80000	0
185	0	25942	25942	KN149818.1	20	80000	0
186	0	10210	10210	KN149819.1	20	80000	0
187	0	1281	1281	KN149820.1	20	80000	0
188	0	31785	31785	KN149821.1	20	80000	0
189	0	2460	2460	KN149822.1	20	80000	0
190	0	14034	14034	KN149823.1	20	80000	0
191	0	2357	2357	KN149824.1	20	80000	0
192	0	22128	22128	KN149825.1	20	80000	0
193	0	90482	90482	KN149826.1	20	80000	0
194	0	13555	13555	KN149827.1	20	80000	0
195	0	11414	11414	KN149828.1	20	80000	0
196	0	27323	27323	KN149829.1	20	80000	0
197	0	32768	32768	KN149830.1	20	80000	0
198	0	50343	50343	KN149831.1	20	80000	0
199	0	12483	12483	KN149832.1	20	80000	0
200	0	2778	2778	KN149833.1	20	80000	0
201	0	17343	17343	KN149834.1	20	80000	0
202	0	25861	25861	KN149835.1	20	80000	0
203	0	34954	34954	KN149836.1	20	80000	0
204	0	8007	8007	KN149837.1	20	80000	0
205	0	29025	29025	KN149838.1	20	80000	0
206	0	12998	12998	KN149839.1	20	80000	0
207	0	46864	46864	KN149840.1	20	80000	0
208	0	10085	10085	KN149841.1	20	80000	0
209	0	17614	17614	KN149842.1	20	80000	0
210	0	33258	33258	KN149843.1	20	80000	0
211	0	10201	10201	KN149844.1	20	80000	0
212	0	3367	3367	KN149845.1	20	80000	0
213	0	28664	28664	KN149846.1	20	80000	0
214	0	130903	130903	KN149847.1	20	80000	0
215	0	10341	10341	KN149848.1	20	80000	0
216	0	20421	20421	KN149849.1	20	80000	0
217	0	33401	33401	KN149850.1	20	80000	0
218	0	12094	12094	KN149851.1	20	80000	0
219	0	30223	30223	KN149852.1	20	80000	0
220	0	12817	12817	KN149853.1	20	80000	0
221	0	6367	6367	KN149854.1	20	80000	0
222	0	23165	23165	KN149855.1	20	80000	0
223	0	35330	35330	KN149856.1	20	80000	0
224	0	10132	10132	KN149857.1	20	80000	0
225	0	44054	44054	KN149858.1	20	80000	0
226	0	53306	53306	KN149859.1	20	80000	0
227	0	17408	17408	KN149860.1	20	80000	0
228	0	14336	14336	KN149861.1	20	80000	0
229	0	11987	11987	KN149862.1	20	80000	0
230	0	11955	11955	KN149863.1	20	80000	0
231	0	12929	12929	KN149864.1	20	80000	0
232	0	49167	49167	KN149865.1	20	80000	0
233	0	14752	14752	KN149866.1	20	80000	0
234	0	1514	1514	KN149867.1	20	80000	0
235	0	50629	50629	KN149868.1	20	80000	0
236	0	21474	21474	KN149869.1	20	80000	0
237	0	44680	44680	KN149870.1	20	80000	0
238	0	22553	22553	KN149871.1	20	80000	0
239	0	12222	12222	KN149872.1	20	80000	0
240	0	1146	1146	KN149873.1	20	80000	0
241	0	5295	5295	KN149874.1	20	80000	0
242	0	13354	13354	KN149875.1	20	80000	0
243	0	11298	11298	KN149876.1	20	80000	0
244	0	30410	30410	KN149877.1	20	80000	0
245	0	7547	7547	KN149878.1	20	80000	0
246	0	11893	11893	KN149879.1	20	80000	0
247	0	64889	64889	KN149880.1	20	80000	0
248	0	10736	10736	KN149881.1	20	80000	0
249	0	7649	7649	KN149882.1	20	80000	0
250	0	12434	12434	KN149883.1	20	80000	0
251	0	51715	51715	KN149884.1	20	80000	0
252	0	1347	1347	KN149885.1	20	80000	0
253	0	1633	1633	KN149886.1	20	80000	0
254	0	11971	11971	KN149887.1	20	80000	0
255	0	17117	17117	KN149888.1	20	80000	0
256	0	10166	10166	KN149889.1	20	80000	0
257	0	12029	12029	KN149890.1	20	80000	0
258	0	10762	10762	KN149891.1	20	80000	0
259	0	24638	24638	KN149892.1	20	80000	0
260	0	27995	27995	KN149893.1	20	80000	0
261	0	15058	15058	KN149894.1	20	80000	0
262	0	92930	92930	KN149895.1	20	80000	0
263	0	13102	13102	KN149896.1	20	80000	0
264	0	14044	14044	KN149897.1	20	80000	0
265	0	4537	4537	KN149898.1	20	80000	0
266	0	13632	13632	KN149899.1	20	80000	0
267	0	11016	11016	KN149900.1	20	80000	0
268	0	10512	10512	KN149901.1	20	80000	0
269	0	16044	16044	KN149902.1	20	80000	0
270	0	11318	11318	KN149903.1	20	80000	0
271	0	89156	89156	KN149904.1	20	80000	0
272	0	14056	14056	KN149905.1	20	80000	0
273	0	38987	38987	KN149906.1	20	80000	0
274	0	9870	9870	KN149907.1	20	80000	0
275	0	12800	12800	KN149908.1	20	80000	0
276	0	40056	40056	KN149909.1	20	80000	0
277	0	142061	142061	KN149910.1	20	80000	0
278	0	11128	11128	KN149911.1	20	80000	0
279	0	77979	77979	KN149912.1	20	80000	0
280	0	16487	16487	KN149913.1	20	80000	0
281	0	18241	18241	KN149914.1	20	80000	0
282	0	10395	10395	KN149915.1	20	80000	0
283	0	4293	4293	KN149916.1	20	80000	0
284	0	3831	3831	KN149917.1	20	80000	0
285	0	6170	6170	KN149918.1	20	80000	0
286	0	21073	21073	KN149919.1	20	80000	0
287	0	18168	18168	KN149920.1	20	80000	0
288	0	28254	28254	KN149921.1	20	80000	0
289	0	12529	12529	KN149922.1	20	80000	0
290	0	36729	36729	KN149923.1	20	80000	0
291	0	23395	23395	KN149924.1	20	80000	0
292	0	29860	29860	KN149925.1	20	80000	0
293	0	3688	3688	KN149926.1	20	80000	0
294	0	11950	11950	KN149927.1	20	80000	0
295	0	14297	14297	KN149928.1	20	80000	0
296	0	38097	38097	KN149929.1	20	80000	0
297	0	98773	98773	KN149930.1	20	80000	0
298	0	6703	6703	KN149931.1	20	80000	0
299	0	89521	89521	KN149932.1	20	80000	0
300	0	13433	13433	KN149933.1	20	80000	0
301	0	12451	12451	KN149934.1	20	80000	0
302	0	9230	9230	KN149935.1	20	80000	0
303	0	16058	16058	KN149936.1	20	80000	0
304	0	14110	14110	KN149937.1	20	80000	0
305	0	12455	12455	KN149938.1	20	80000	0
306	0	76611	76611	KN149939.1	20	80000	0
307	0	11887	11887	KN149940.1	20	80000	0
308	0	13607	13607	KN149941.1	20	80000	0
309	0	9522	9522	KN149942.1	20	80000	0
310	0	29608	29608	KN149943.1	20	80000	0
311	0	24909	24909	KN149944.1	20	80000	0
312	0	9994	9994	KN149945.1	20	80000	0
313	0	33071	33071	KN149946.1	20	80000	0
314	0	23293	23293	KN149947.1	20	80000	0
315	0	117499	117499	KN149948.1	20	80000	0
316	0	64126	64126	KN149949.1	20	80000	0
317	0	5952	5952	KN149950.1	20	80000	0
318	0	5000	5000	KN149951.1	20	80000	0
319	0	66365	66365	KN149952.1	20	80000	0
320	0	46218	46218	KN149953.1	20	80000	0
321	0	1953	1953	KN149954.1	20	80000	0
322	0	19758	19758	KN149955.1	20	80000	0
323	0	1889	1889	KN149956.1	20	80000	0
324	0	1094	1094	KN149957.1	20	80000	0
325	0	43073	43073	KN149958.1	20	80000	0
326	0	59274	59274	KN149959.1	20	80000	0
327	0	9235	9235	KN149960.1	20	80000	0
328	0	20600	20600	KN149961.1	20	80000	0
329	0	136181	136181	KN149962.1	20	80000	0
330	0	83881	83881	KN149963.1	20	80000	0
331	0	11592	11592	KN149964.1	20	80000	0
332	0	14790	14790	KN149965.1	20	80000	0
333	0	131566	131566	KN149966.1	20	80000	0
334	0	8612	8612	KN149967.1	20	80000	0
335	0	82990	82990	KN149968.1	20	80000	0
336	0	13714	13714	KN149969.1	20	80000	0
337	0	17511	17511	KN149970.1	20	80000	0
338	0	11275	11275	KN149971.1	20	80000	0
339	0	1358	1358	KN149972.1	20	80000	0
340	0	35555	35555	KN149973.1	20	80000	0
341	0	19596	19596	KN149974.1	20	80000	0
342	0	2035	2035	KN149975.1	20	80000	0
343	0	11858	11858	KN149976.1	20	80000	0
344	0	20138	20138	KN149977.1	20	80000	0
345	0	16801	16801	KN149978.1	20	80000	0
346	0	22834	22834	KN149979.1	20	80000	0
347	0	7980	7980	KN149980.1	20	80000	0
348	0	12811	12811	KN149981.1	20	80000	0
349	0	31814	31814	KN149982.1	20	80000	0
350	0	17884	17884	KN149983.1	20	80000	0
351	0	96477	96477	KN149984.1	20	80000	0
352	0	1354	1354	KN149985.1	20	80000	0
353	0	8801	8801	KN149986.1	20	80000	0
354	0	38433	38433	KN149987.1	20	80000	0
355	0	9944	9944	KN149988.1	20	80000	0
356	0	34480	34480	KN149989.1	20	80000	0
357	0	57651	57651	KN149990.1	20	80000	0
358	0	9871	9871	KN149991.1	20	80000	0
359	0	57912	57912	KN149992.1	20	80000	0
360	0	16921	16921	KN149993.1	20	80000	0
361	0	1137	1137	KN149994.1	20	80000	0
362	0	12015	12015	KN149995.1	20	80000	0
363	0	33528	33528	KN149996.1	20	80000	0
364	0	6296	6296	KN149997.1	20	80000	0
365	0	74724	74724	KN149998.1	20	80000	0
366	0	14071	14071	KN149999.1	20	80000	0
367	0	69737	69737	KN150000.1	20	80000	0
368	0	28767	28767	KN150001.1	20	80000	0
369	0	17430	17430	KN150002.1	20	80000	0
370	0	19572	19572	KN150003.1	20	80000	0
371	0	11444	11444	KN150004.1	20	80000	0
372	0	34409	34409	KN150005.1	20	80000	0
373	0	10518	10518	KN150006.1	20	80000	0
374	0	13072	13072	KN150007.1	20	80000	0
375	0	15572	15572	KN150008.1	20	80000	0
376	0	17727	17727	KN150009.1	20	80000	0
377	0	14703	14703	KN150010.1	20	80000	0
378	0	12995	12995	KN150011.1	20	80000	0
379	0	11998	11998	KN150012.1	20	80000	0
380	0	8488	8488	KN150013.1	20	80000	0
381	0	13588	13588	KN150014.1	20	80000	0
382	0	33441	33441	KN150015.1	20	80000	0
383	0	21592	21592	KN150016.1	20	80000	0
384	0	25636	25636	KN150017.1	20	80000	0
385	0	1063	1063	KN150018.1	20	80000	0
386	0	28998	28998	KN150019.1	20	80000	0
387	0	11925	11925	KN150020.1	20	80000	0
388	0	103967	103967	KN150021.1	20	80000	0
389	0	76538	76538	KN150022.1	20	80000	0
390	0	22153	22153	KN150023.1	20	80000	0
391	0	1714	1714	KN150024.1	20	80000	0
392	0	26343	26343	KN150025.1	20	80000	0
393	0	1755	1755	KN150026.1	20	80000	0
394	0	2148	2148	KN150027.1	20	80000	0
395	0	19517	19517	KN150028.1	20	80000	0
396	0	12415	12415	KN150029.1	20	80000	0
397	0	57074	57074	KN150030.1	20	80000	0
398	0	60899	60899	KN150031.1	20	80000	0
399	0	29546	29546	KN150032.1	20	80000	0
400	0	56448	56448	KN150033.1	20	80000	0
401	0	1919	1919	KN150034.1	20	80000	0
402	0	38086	38086	KN150035.1	20	80000	0
403	0	4412	4412	KN150036.1	20	80000	0
404	0	2866	2866	KN150037.1	20	80000	0
405	0	71326	71326	KN150038.1	20	80000	0
406	0	3463	3463	KN150039.1	20	80000	0
407	0	19896	19896	KN150040.1	20	80000	0
408	0	58003	58003	KN150041.1	20	80000	0
409	0	30789	30789	KN150042.1	20	80000	0
410	0	31984	31984	KN150043.1	20	80000	0
411	0	9097	9097	KN150044.1	20	80000	0
412	0	23207	23207	KN150045.1	20	80000	0
413	0	148772	148772	KN150046.1	20	80000	0
414	0	20749	20749	KN150047.1	20	80000	0
415	0	128109	128109	KN150048.1	20	80000	0
416	0	45008	45008	KN150049.1	20	80000	0
417	0	8203	8203	KN150050.1	20	80000	0
418	0	1995	1995	KN150051.1	20	80000	0
419	0	15943	15943	KN150052.1	20	80000	0
420	0	32328	32328	KN150053.1	20	80000	0
421	0	16143	16143	KN150054.1	20	80000	0
422	0	32561	32561	KN150055.1	20	80000	0
423	0	29449	29449	KN150056.1	20	80000	0
424	0	10736	10736	KN150057.1	20	80000	0
425	0	21348	21348	KN150058.1	20	80000	0
426	0	16588	16588	KN150059.1	20	80000	0
427	0	80234	80234	KN150060.1	20	80000	0
428	0	24048	24048	KN150061.1	20	80000	0
429	0	35038	35038	KN150062.1	20	80000	0
430	0	20846	20846	KN150063.1	20	80000	0
431	0	14598	14598	KN150064.1	20	80000	0
432	0	9859	9859	KN150065.1	20	80000	0
433	0	29537	29537	KN150066.1	20	80000	0
434	0	27325	27325	KN150067.1	20	80000	0
435	0	62725	62725	KN150068.1	20	80000	0
436	0	12799	12799	KN150069.1	20	80000	0
437	0	14070	14070	KN150070.1	20	80000	0
438	0	14960	14960	KN150071.1	20	80000	0
439	0	13309	13309	KN150072.1	20	80000	0
440	0	14052	14052	KN150073.1	20	80000	0
441	0	28653	28653	KN150074.1	20	80000	0
442	0	13883	13883	KN150075.1	20	80000	0
443	0	14425	14425	KN150076.1	20	80000	0
444	0	51360	51360	KN150077.1	20	80000	0
445	0	12098	12098	KN150078.1	20	80000	0
446	0	46800	46800	KN150079.1	20	80000	0
447	0	37662	37662	KN150080.1	20	80000	0
448	0	12836	12836	KN150081.1	20	80000	0
449	0	8788	8788	KN150082.1	20	80000	0
450	0	49514	49514	KN150083.1	20	80000	0
451	0	24192	24192	KN150084.1	20	80000	0
452	0	29177	29177	KN150085.1	20	80000	0
453	0	1639	1639	KN150086.1	20	80000	0
454	0	11020	11020	KN150087.1	20	80000	0
455	0	24203	24203	KN150088.1	20	80000	0
456	0	13104	13104	KN150089.1	20	80000	0
457	0	12028	12028	KN150090.1	20	80000	0
458	0	36410	36410	KN150091.1	20	80000	0
459	0	14544	14544	KN150092.1	20	80000	0
460	0	14738	14738	KN150093.1	20	80000	0
461	0	7824	7824	KN150094.1	20	80000	0
462	0	9204	9204	KN150095.1	20	80000	0
463	0	11550	11550	KN150096.1	20	80000	0
464	0	11690	11690	KN150097.1	20	80000	0
465	0	68279	68279	KN150098.1	20	80000	0
466	0	79937	79937	KN150099.1	20	80000	0
467	0	9237	9237	KN150100.1	20	80000	0
468	0	25174	25174	KN150101.1	20	80000	0
469	0	34431	34431	KN150102.1	20	80000	0
470	0	4090	4090	KN150103.1	20	80000	0
471	0	53188	53188	KN150104.1	20	80000	0
472	0	58062	58062	KN150105.1	20	80000	0
473	0	56524	56524	KN150106.1	20	80000	0
474	0	78223	78223	KN150107.1	20	80000	0
475	0	19459	19459	KN150108.1	20	80000	0
476	0	5564	5564	KN150109.1	20	80000	0
477	0	9804	9804	KN150110.1	20	80000	0
478	0	29931	29931	KN150111.1	20	80000	0
479	0	3423	3423	KN150112.1	20	80000	0
480	0	19310	19310	KN150113.1	20	80000	0
481	0	24178	24178	KN150114.1	20	80000	0
482	0	18676	18676	KN150115.1	20	80000	0
483	0	15497	15497	KN150116.1	20	80000	0
484	0	48543	48543	KN150117.1	20	80000	0
485	0	54494	54494	KN150118.1	20	80000	0
486	0	1143	1143	KN150119.1	20	80000	0
487	0	27511	27511	KN150120.1	20	80000	0
488	0	8447	8447	KN150121.1	20	80000	0
489	0	67534	67534	KN150122.1	20	80000	0
490	0	51978	51978	KN150123.1	20	80000	0
491	0	27208	27208	KN150124.1	20	80000	0
492	0	83315	83315	KN150125.1	20	80000	0
493	0	24847	24847	KN150126.1	20	80000	0
494	0	33302	33302	KN150127.1	20	80000	0
495	0	12262	12262	KN150128.1	20	80000	0
496	0	107891	107891	KN150129.1	20	80000	0
497	0	9925	9925	KN150130.1	20	80000	0
498	0	70868	70868	KN150131.1	20	80000	0
499	0	13999	13999	KN150132.1	20	80000	0
500	0	82225	82225	KN150133.1	20	80000	0
501	0	29067	29067	KN150134.1	20	80000	0
502	0	6944	6944	KN150135.1	20	80000	0
503	0	49373	49373	KN150136.1	20	80000	0
504	0	36779	36779	KN150137.1	20	80000	0
505	0	14383	14383	KN150138.1	20	80000	0
506	0	16647	16647	KN150139.1	20	80000	0
507	0	32180	32180	KN150140.1	20	80000	0
508	0	17117	17117	KN150141.1	20	80000	0
509	0	16050	16050	KN150142.1	20	80000	0
510	0	4977	4977	KN150143.1	20	80000	0
511	0	14974	14974	KN150144.1	20	80000	0
512	0	9970	9970	KN150145.1	20	80000	0
513	0	9714	9714	KN150146.1	20	80000	0
514	0	7977	7977	KN150147.1	20	80000	0
515	0	44589	44589	KN150148.1	20	80000	0
516	0	3784	3784	KN150149.1	20	80000	0
517	0	9780	9780	KN150150.1	20	80000	0
518	0	27317	27317	KN150151.1	20	80000	0
519	0	9348	9348	KN150152.1	20	80000	0
520	0	1545	1545	KN150153.1	20	80000	0
521	0	21695	21695	KN150154.1	20	80000	0
522	0	10282	10282	KN150155.1	20	80000	0
523	0	33247	33247	KN150156.1	20	80000	0
524	0	18756	18756	KN150157.1	20	80000	0
525	0	106536	106536	KN150158.1	20	80000	0
526	0	35229	35229	KN150159.1	20	80000	0
527	0	17824	17824	KN150160.1	20	80000	0
528	0	12647	12647	KN150161.1	20	80000	0
529	0	10930	10930	KN150162.1	20	80000	0
530	0	1082	1082	KN150163.1	20	80000	0
531	0	11300	11300	KN150164.1	20	80000	0
532	0	32739	32739	KN150165.1	20	80000	0
533	0	49457	49457	KN150166.1	20	80000	0
534	0	13466	13466	KN150167.1	20	80000	0
535	0	28382	28382	KN150168.1	20	80000	0
536	0	7260	7260	KN150169.1	20	80000	0
537	0	55716	55716	KN150170.1	20	80000	0
538	0	140649	140649	KN150171.1	20	80000	0
539	0	40634	40634	KN150172.1	20	80000	0
540	0	50946	50946	KN150173.1	20	80000	0
541	0	13450	13450	KN150174.1	20	80000	0
542	0	24612	24612	KN150175.1	20	80000	0
543	0	69061	69061	KN150176.1	20	80000	0
544	0	21670	21670	KN150177.1	20	80000	0
545	0	28040	28040	KN150178.1	20	80000	0
546	0	47473	47473	KN150179.1	20	80000	0
547	0	1872	1872	KN150180.1	20	80000	0
548	0	32761	32761	KN150181.1	20	80000	0
549	0	11735	11735	KN150182.1	20	80000	0
550	0	22266	22266	KN150183.1	20	80000	0
551	0	16312	16312	KN150184.1	20	80000	0
552	0	8651	8651	KN150185.1	20	80000	0
553	0	23923	23923	KN150186.1	20	80000	0
554	0	19179	19179	KN150187.1	20	80000	0
555	0	9856	9856	KN150188.1	20	80000	0
556	0	38868	38868	KN150189.1	20	80000	0
557	0	11399	11399	KN150190.1	20	80000	0
558	0	42303	42303	KN150191.1	20	80000	0
559	0	1918	1918	KN150192.1	20	80000	0
560	0	12580	12580	KN150193.1	20	80000	0
561	0	13629	13629	KN150194.1	20	80000	0
562	0	18921	18921	KN150195.1	20	80000	0
563	0	89077	89077	KN150196.1	20	80000	0
564	0	14532	14532	KN150197.1	20	80000	0
565	0	18196	18196	KN150198.1	20	80000	0
566	0	16564	16564	KN150199.1	20	80000	0
567	0	31861	31861	KN150200.1	20	80000	0
568	0	9480	9480	KN150201.1	20	80000	0
569	0	15451	15451	KN150202.1	20	80000	0
570	0	24004	24004	KN150203.1	20	80000	0
571	0	95149	95149	KN150204.1	20	80000	0
572	0	2620	2620	KN150205.1	20	80000	0
573	0	2052	2052	KN150206.1	20	80000	0
574	0	117821	117821	KN150207.1	20	80000	0
575	0	33163	33163	KN150208.1	20	80000	0
576	0	4398	4398	KN150209.1	20	80000	0
577	0	12550	12550	KN150210.1	20	80000	0
578	0	16386	16386	KN150211.1	20	80000	0
579	0	18932	18932	KN150212.1	20	80000	0
580	0	16101	16101	KN150213.1	20	80000	0
581	0	162877	162877	KN150214.1	20	80000	0
582	0	1237	1237	KN150215.1	20	80000	0
583	0	1020	1020	KN150216.1	20	80000	0
584	0	13840	13840	KN150217.1	20	80000	0
585	0	15354	15354	KN150218.1	20	80000	0
586	0	16672	16672	KN150219.1	20	80000	0
587	0	29625	29625	KN150220.1	20	80000	0
588	0	28122	28122	KN150221.1	20	80000	0
589	0	110669	110669	KN150222.1	20	80000	0
590	0	1141	1141	KN150223.1	20	80000	0
591	0	24154	24154	KN150224.1	20	80000	0
592	0	20429	20429	KN150225.1	20	80000	0
593	0	25293	25293	KN150226.1	20	80000	0
594	0	31979	31979	KN150227.1	20	80000	0
595	0	17061	17061	KN150228.1	20	80000	0
596	0	1251	1251	KN150229.1	20	80000	0
597	0	149710	149710	KN150230.1	20	80000	0
598	0	2322	2322	KN150231.1	20	80000	0
599	0	53540	53540	KN150232.1	20	80000	0
600	0	2246	2246	KN150233.1	20	80000	0
601	0	18511	18511	KN150234.1	20	80000	0
602	0	13664	13664	KN150235.1	20	80000	0
603	0	19315	19315	KN150236.1	20	80000	0
604	0	1732	1732	KN150237.1	20	80000	0
605	0	9450	9450	KN150238.1	20	80000	0
606	0	33607	33607	KN150239.1	20	80000	0
607	0	31723	31723	KN150240.1	20	80000	0
608	0	60821	60821	KN150241.1	20	80000	0
609	0	20063	20063	KN150242.1	20	80000	0
610	0	44953	44953	KN150243.1	20	80000	0
611	0	42860	42860	KN150244.1	20	80000	0
612	0	8814	8814	KN150245.1	20	80000	0
613	0	15365	15365	KN150246.1	20	80000	0
614	0	728	728	KN150247.1	20	80000	0
615	0	18273	18273	KN150248.1	20	80000	0
616	0	12261	12261	KN150249.1	20	80000	0
617	0	13560	13560	KN150250.1	20	80000	0
618	0	26988	26988	KN150251.1	20	80000	0
619	0	43133	43133	KN150252.1	20	80000	0
620	0	3149	3149	KN150253.1	20	80000	0
621	0	12144	12144	KN150254.1	20	80000	0
622	0	36661	36661	KN150255.1	20	80000	0
623	0	17390	17390	KN150256.1	20	80000	0
624	0	12735	12735	KN150257.1	20	80000	0
625	0	95885	95885	KN150258.1	20	80000	0
626	0	50098	50098	KN150259.1	20	80000	0
627	0	12318	12318	KN150260.1	20	80000	0
628	0	5601	5601	KN150261.1	20	80000	0
629	0	81659	81659	KN150262.1	20	80000	0
630	0	31336	31336	KN150263.1	20	80000	0
631	0	16955	16955	KN150264.1	20	80000	0
632	0	51555	51555	KN150265.1	20	80000	0
633	0	78263	78263	KN150266.1	20	80000	0
634	0	77778	77778	KN150267.1	20	80000	0
635	0	15280	15280	KN150268.1	20	80000	0
636	0	48062	48062	KN150269.1	20	80000	0
637	0	22285	22285	KN150270.1	20	80000	0
638	0	12637	12637	KN150271.1	20	80000	0
639	0	34295	34295	KN150272.1	20	80000	0
640	0	81940	81940	KN150273.1	20	80000	0
641	0	12247	12247	KN150274.1	20	80000	0
642	0	13800	13800	KN150275.1	20	80000	0
643	0	12942	12942	KN150276.1	20	80000	0
644	0	1954	1954	KN150277.1	20	80000	0
645	0	30978	30978	KN150278.1	20	80000	0
646	0	11402	11402	KN150279.1	20	80000	0
647	0	10487	10487	KN150280.1	20	80000	0
648	0	3763	3763	KN150281.1	20	80000	0
649	0	23758	23758	KN150282.1	20	80000	0
650	0	13933	13933	KN150283.1	20	80000	0
651	0	18131	18131	KN150284.1	20	80000	0
652	0	25361	25361	KN150285.1	20	80000	0
653	0	9068	9068	KN150286.1	20	80000	0
654	0	11856	11856	KN150287.1	20	80000	0
655	0	12496	12496	KN150288.1	20	80000	0
656	0	22206	22206	KN150289.1	20	80000	0
657	0	18248	18248	KN150290.1	20	80000	0
658	0	25796	25796	KN150291.1	20	80000	0
659	0	9984	9984	KN150292.1	20	80000	0
660	0	40764	40764	KN150293.1	20	80000	0
661	0	1627	1627	KN150294.1	20	80000	0
662	0	5486	5486	KN150295.1	20	80000	0
663	0	10238	10238	KN150296.1	20	80000	0
664	0	23472	23472	KN150297.1	20	80000	0
665	0	1322	1322	KN150298.1	20	80000	0
666	0	23511	23511	KN150299.1	20	80000	0
667	0	9489	9489	KN150300.1	20	80000	0
668	0	18664	18664	KN150301.1	20	80000	0
669	0	13538	13538	KN150302.1	20	80000	0
670	0	39288	39288	KN150303.1	20	80000	0
671	0	10004	10004	KN150304.1	20	80000	0
672	0	23261	23261	KN150305.1	20	80000	0
673	0	36728	36728	KN150306.1	20	80000	0
674	0	9167	9167	KN150307.1	20	80000	0
675	0	18907	18907	KN150308.1	20	80000	0
676	0	20999	20999	KN150309.1	20	80000	0
677	0	20509	20509	KN150310.1	20	80000	0
678	0	15747	15747	KN150311.1	20	80000	0
679	0	17282	17282	KN150312.1	20	80000	0
680	0	20655	20655	KN150313.1	20	80000	0
681	0	12455	12455	KN150314.1	20	80000	0
682	0	20424	20424	KN150315.1	20	80000	0
683	0	11489	11489	KN150316.1	20	80000	0
684	0	14866	14866	KN150317.1	20	80000	0
685	0	2580	2580	KN150318.1	20	80000	0
686	0	15807	15807	KN150319.1	20	80000	0
687	0	1241	1241	KN150320.1	20	80000	0
688	0	3079	3079	KN150321.1	20	80000	0
689	0	19644	19644	KN150322.1	20	80000	0
690	0	18137	18137	KN150323.1	20	80000	0
691	0	24032	24032	KN150324.1	20	80000	0
692	0	19525	19525	KN150325.1	20	80000	0
693	0	109565	109565	KN150326.1	20	80000	0
694	0	19949	19949	KN150327.1	20	80000	0
695	0	17410	17410	KN150328.1	20	80000	0
696	0	13297	13297	KN150329.1	20	80000	0
697	0	28440	28440	KN150330.1	20	80000	0
698	0	44968	44968	KN150331.1	20	80000	0
699	0	22862	22862	KN150332.1	20	80000	0
700	0	12275	12275	KN150333.1	20	80000	0
701	0	22542	22542	KN150334.1	20	80000	0
702	0	44504	44504	KN150335.1	20	80000	0
703	0	48672	48672	KN150336.1	20	80000	0
704	0	20260	20260	KN150337.1	20	80000	0
705	0	1142	1142	KN150338.1	20	80000	0
706	0	75108	75108	KN150339.1	20	80000	0
707	0	28741	28741	KN150340.1	20	80000	0
708	0	31147	31147	KN150341.1	20	80000	0
709	0	82590	82590	KN150342.1	20	80000	0
710	0	26928	26928	KN150343.1	20	80000	0
711	0	19681	19681	KN150344.1	20	80000	0
712	0	17012	17012	KN150345.1	20	80000	0
713	0	70538	70538	KN150346.1	20	80000	0
714	0	51528	51528	KN150347.1	20	80000	0
715	0	42704	42704	KN150348.1	20	80000	0
716	0	29114	29114	KN150349.1	20	80000	0
717	0	9245	9245	KN150350.1	20	80000	0
718	0	49608	49608	KN150351.1	20	80000	0
719	0	15907	15907	KN150352.1	20	80000	0
720	0	19631	19631	KN150353.1	20	80000	0
721	0	1452	1452	KN150354.1	20	80000	0
722	0	6731	6731	KN150355.1	20	80000	0
723	0	1177	1177	KN150356.1	20	80000	0
724	0	27326	27326	KN150357.1	20	80000	0
725	0	9951	9951	KN150358.1	20	80000	0
726	0	71383	71383	KN150359.1	20	80000	0
727	0	15639	15639	KN150360.1	20	80000	0
728	0	53624	53624	KN150361.1	20	80000	0
729	0	17145	17145	KN150362.1	20	80000	0
730	0	22766	22766	KN150363.1	20	80000	0
731	0	15084	15084	KN150364.1	20	80000	0
732	0	10769	10769	KN150365.1	20	80000	0
733	0	10057	10057	KN150366.1	20	80000	0
734	0	1114	1114	KN150367.1	20	80000	0
735	0	18491	18491	KN150368.1	20	80000	0
736	0	11460	11460	KN150369.1	20	80000	0
737	0	1323	1323	KN150370.1	20	80000	0
738	0	13836	13836	KN150371.1	20	80000	0
739	0	29560	29560	KN150372.1	20	80000	0
740	0	13130	13130	KN150373.1	20	80000	0
741	0	9775	9775	KN150374.1	20	80000	0
742	0	111208	111208	KN150375.1	20	80000	0
743	0	39971	39971	KN150376.1	20	80000	0
744	0	5727	5727	KN150377.1	20	80000	0
745	0	4206	4206	KN150378.1	20	80000	0
746	0	29907	29907	KN150379.1	20	80000	0
747	0	12144	12144	KN150380.1	20	80000	0
748	0	8595	8595	KN150381.1	20	80000	0
749	0	14074	14074	KN150382.1	20	80000	0
750	0	7777	7777	KN150383.1	20	80000	0
751	0	22969	22969	KN150384.1	20	80000	0
752	0	37055	37055	KN150385.1	20	80000	0
753	0	35900	35900	KN150386.1	20	80000	0
754	0	15215	15215	KN150387.1	20	80000	0
755	0	22284	22284	KN150388.1	20	80000	0
756	0	10334	10334	KN150389.1	20	80000	0
757	0	19066	19066	KN150390.1	20	80000	0
758	0	26543	26543	KN150391.1	20	80000	0
759	0	12069	12069	KN150392.1	20	80000	0
760	0	12073	12073	KN150393.1	20	80000	0
761	0	17139	17139	KN150394.1	20	80000	0
762	0	9792	9792	KN150395.1	20	80000	0
763	0	8176	8176	KN150396.1	20	80000	0
764	0	17295	17295	KN150397.1	20	80000	0
765	0	39557	39557	KN150398.1	20	80000	0
766	0	19362	19362	KN150399.1	20	80000	0
767	0	34930	34930	KN150400.1	20	80000	0
768	0	10081	10081	KN150401.1	20	80000	0
769	0	47971	47971	KN150402.1	20	80000	0
770	0	34697	34697	KN150403.1	20	80000	0
771	0	18160	18160	KN150404.1	20	80000	0
772	0	76919	76919	KN150405.1	20	80000	0
773	0	17215	17215	KN150406.1	20	80000	0
774	0	31814	31814	KN150407.1	20	80000	0
775	0	37191	37191	KN150408.1	20	80000	0
776	0	1729	1729	KN150409.1	20	80000	0
777	0	14841	14841	KN150410.1	20	80000	0
778	0	20886	20886	KN150411.1	20	80000	0
779	0	9605	9605	KN150412.1	20	80000	0
780	0	15078	15078	KN150413.1	20	80000	0
781	0	35871	35871	KN150414.1	20	80000	0
782	0	70574	70574	KN150415.1	20	80000	0
783	0	33835	33835	KN150416.1	20	80000	0
784	0	2254	2254	KN150417.1	20	80000	0
785	0	14930	14930	KN150418.1	20	80000	0
786	0	14114	14114	KN150419.1	20	80000	0
787	0	14290	14290	KN150420.1	20	80000	0
788	0	14951	14951	KN150421.1	20	80000	0
789	0	15053	15053	KN150422.1	20	80000	0
790	0	15221	15221	KN150423.1	20	80000	0
791	0	11928	11928	KN150424.1	20	80000	0
792	0	110593	110593	KN150425.1	20	80000	0
793	0	21499	21499	KN150426.1	20	80000	0
794	0	45580	45580	KN150427.1	20	80000	0
795	0	29216	29216	KN150428.1	20	80000	0
796	0	17683	17683	KN150429.1	20	80000	0
797	0	16452	16452	KN150430.1	20	80000	0
798	0	89659	89659	KN150431.1	20	80000	0
799	0	91010	91010	KN150432.1	20	80000	0
800	0	8322	8322	KN150433.1	20	80000	0
801	0	12053	12053	KN150434.1	20	80000	0
802	0	123991	123991	KN150435.1	20	80000	0
803	0	17739	17739	KN150436.1	20	80000	0
804	0	1262	1262	KN150437.1	20	80000	0
805	0	7619	7619	KN150438.1	20	80000	0
806	0	10343	10343	KN150439.1	20	80000	0
807	0	1193	1193	KN150440.1	20	80000	0
808	0	12439	12439	KN150441.1	20	80000	0
809	0	67738	67738	KN150442.1	20	80000	0
810	0	11834	11834	KN150443.1	20	80000	0
811	0	11830	11830	KN150444.1	20	80000	0
812	0	12072	12072	KN150445.1	20	80000	0
813	0	12446	12446	KN150446.1	20	80000	0
814	0	6779	6779	KN150447.1	20	80000	0
815	0	3709	3709	KN150448.1	20	80000	0
816	0	62607	62607	KN150449.1	20	80000	0
817	0	25362	25362	KN150450.1	20	80000	0
818	0	14920	14920	KN150451.1	20	80000	0
819	0	8345	8345	KN150452.1	20	80000	0
820	0	13591	13591	KN150453.1	20	80000	0
821	0	18479	18479	KN150454.1	20	80000	0
822	0	73536	73536	KN150455.1	20	80000	0
823	0	76246	76246	KN150456.1	20	80000	0
824	0	1076	1076	KN150457.1	20	80000	0
825	0	17481	17481	KN150458.1	20	80000	0
826	0	45603	45603	KN150459.1	20	80000	0
827	0	266772	266772	KN150460.1	20	80000	0
828	0	1000	1000	KN150461.1	20	80000	0
829	0	24623	24623	KN150462.1	20	80000	0
830	0	29963	29963	KN150463.1	20	80000	0
831	0	24865	24865	KN150464.1	20	80000	0
832	0	1765	1765	KN150465.1	20	80000	0
833	0	41319	41319	KN150466.1	20	80000	0
834	0	11202	11202	KN150467.1	20	80000	0
835	0	25381	25381	KN150468.1	20	80000	0
836	0	14614	14614	KN150469.1	20	80000	0
837	0	2027	2027	KN150470.1	20	80000	0
838	0	76663	76663	KN150471.1	20	80000	0
839	0	14586	14586	KN150472.1	20	80000	0
840	0	1285	1285	KN150473.1	20	80000	0
841	0	312116	312116	KN150474.1	20	80000	0
842	0	17517	17517	KN150475.1	20	80000	0
843	0	59211	59211	KN150476.1	20	80000	0
844	0	61693	61693	KN150477.1	20	80000	0
845	0	25813	25813	KN150478.1	20	80000	0
846	0	48186	48186	KN150479.1	20	80000	0
847	0	1422	1422	KN150480.1	20	80000	0
848	0	1008	1008	KN150481.1	20	80000	0
849	0	14895	14895	KN150482.1	20	80000	0
850	0	17332	17332	KN150483.1	20	80000	0
851	0	14965	14965	KN150484.1	20	80000	0
852	0	7348	7348	KN150485.1	20	80000	0
853	0	8572	8572	KN150486.1	20	80000	0
854	0	123701	123701	KN150487.1	20	80000	0
855	0	17582	17582	KN150488.1	20	80000	0
856	0	26739	26739	KN150489.1	20	80000	0
857	0	23057	23057	KN150490.1	20	80000	0
858	0	13001	13001	KN150491.1	20	80000	0
859	0	31617	31617	KN150492.1	20	80000	0
860	0	35575	35575	KN150493.1	20	80000	0
861	0	10108	10108	KN150494.1	20	80000	0
862	0	28160	28160	KN150495.1	20	80000	0
863	0	21062	21062	KN150496.1	20	80000	0
864	0	46188	46188	KN150497.1	20	80000	0
865	0	34205	34205	KN150498.1	20	80000	0
866	0	11840	11840	KN150499.1	20	80000	0
867	0	19866	19866	KN150500.1	20	80000	0
868	0	22392	22392	KN150501.1	20	80000	0
869	0	13027	13027	KN150502.1	20	80000	0
870	0	1834	1834	KN150503.1	20	80000	0
871	0	12094	12094	KN150504.1	20	80000	0
872	0	39265	39265	KN150505.1	20	80000	0
873	0	14319	14319	KN150506.1	20	80000	0
874	0	12629	12629	KN150507.1	20	80000	0
875	0	26814	26814	KN150508.1	20	80000	0
876	0	11846	11846	KN150509.1	20	80000	0
877	0	13237	13237	KN150510.1	20	80000	0
878	0	38183	38183	KN150511.1	20	80000	0
879	0	14003	14003	KN150512.1	20	80000	0
880	0	10220	10220	KN150513.1	20	80000	0
881	0	19391	19391	KN150514.1	20	80000	0
882	0	1813	1813	KN150515.1	20	80000	0
883	0	49339	49339	KN150516.1	20	80000	0
884	0	16171	16171	KN150517.1	20	80000	0
885	0	40394	40394	KN150518.1	20	80000	0
886	0	11974	11974	KN150519.1	20	80000	0
887	0	103159	103159	KN150520.1	20	80000	0
888	0	20896	20896	KN150521.1	20	80000	0
889	0	12046	12046	KN150522.1	20	80000	0
890	0	19004	19004	KN150523.1	20	80000	0
891	0	9948	9948	KN150524.1	20	80000	0
892	0	650	650	KN150525.1	20	80000	0
893	0	15513	15513	KN150526.1	20	80000	0
894	0	20880	20880	KN150527.1	20	80000	0
895	0	13138	13138	KN150528.1	20	80000	0
896	0	81946	81946	KN150529.1	20	80000	0
897	0	7299	7299	KN150530.1	20	80000	0
898	0	15090	15090	KN150531.1	20	80000	0
899	0	21602	21602	KN150532.1	20	80000	0
900	0	1222	1222	KN150533.1	20	80000	0
901	0	17661	17661	KN150534.1	20	80000	0
902	0	2315	2315	KN150535.1	20	80000	0
903	0	17908	17908	KN150536.1	20	80000	0
904	0	27568	27568	KN150537.1	20	80000	0
905	0	12119	12119	KN150538.1	20	80000	0
906	0	23246	23246	KN150539.1	20	80000	0
907	0	15288	15288	KN150540.1	20	80000	0
908	0	12323	12323	KN150541.1	20	80000	0
909	0	12167	12167	KN150542.1	20	80000	0
910	0	2343	2343	KN150543.1	20	80000	0
911	0	1198	1198	KN150544.1	20	80000	0
912	0	17546	17546	KN150545.1	20	80000	0
913	0	10851	10851	KN150546.1	20	80000	0
914	0	37420	37420	KN150547.1	20	80000	0
915	0	46061	46061	KN150548.1	20	80000	0
916	0	17599	17599	KN150549.1	20	80000	0
917	0	14915	14915	KN150550.1	20	80000	0
918	0	9435	9435	KN150551.1	20	80000	0
919	0	74050	74050	KN150552.1	20	80000	0
920	0	14032	14032	KN150553.1	20	80000	0
921	0	9251	9251	KN150554.1	20	80000	0
922	0	9941	9941	KN150555.1	20	80000	0
923	0	9286	9286	KN150556.1	20	80000	0
924	0	41459	41459	KN150557.1	20	80000	0
925	0	12115	12115	KN150558.1	20	80000	0
926	0	26580	26580	KN150559.1	20	80000	0
927	0	2301	2301	KN150560.1	20	80000	0
928	0	22238	22238	KN150561.1	20	80000	0
929	0	22875	22875	KN150562.1	20	80000	0
930	0	11540	11540	KN150563.1	20	80000	0
931	0	17709	17709	KN150564.1	20	80000	0
932	0	20464	20464	KN150565.1	20	80000	0
933	0	39318	39318	KN150566.1	20	80000	0
934	0	49566	49566	KN150567.1	20	80000	0
935	0	108195	108195	KN150568.1	20	80000	0
936	0	24359	24359	KN150569.1	20	80000	0
937	0	42279	42279	KN150570.1	20	80000	0
938	0	16505	16505	KN150571.1	20	80000	0
939	0	28871	28871	KN150572.1	20	80000	0
940	0	26604	26604	KN150573.1	20	80000	0
941	0	18499	18499	KN150574.1	20	80000	0
942	0	11084	11084	KN150575.1	20	80000	0
943	0	36129	36129	KN150576.1	20	80000	0
944	0	13719	13719	KN150577.1	20	80000	0
945	0	103698	103698	KN150578.1	20	80000	0
946	0	23586	23586	KN150579.1	20	80000	0
947	0	32349	32349	KN150580.1	20	80000	0
948	0	12355	12355	KN150581.1	20	80000	0
949	0	12396	12396	KN150582.1	20	80000	0
950	0	1918	1918	KN150583.1	20	80000	0
951	0	51535	51535	KN150584.1	20	80000	0
952	0	12430	12430	KN150585.1	20	80000	0
953	0	17388	17388	KN150586.1	20	80000	0
954	0	8461	8461	KN150587.1	20	80000	0
955	0	14103	14103	KN150588.1	20	80000	0
956	0	18957	18957	KN150589.1	20	80000	0
957	0	5798	5798	KN150590.1	20	80000	0
958	0	8817	8817	KN150591.1	20	80000	0
959	0	50000	50000	KN150592.1	20	80000	0
960	0	14353	14353	KN150593.1	20	80000	0
961	0	19382	19382	KN150594.1	20	80000	0
962	0	12507	12507	KN150595.1	20	80000	0
963	0	60847	60847	KN150596.1	20	80000	0
964	0	2137	2137	KN150597.1	20	80000	0
965	0	12499	12499	KN150598.1	20	80000	0
966	0	19019	19019	KN150599.1	20	80000	0
967	0	32636	32636	KN150600.1	20	80000	0
968	0	11167	11167	KN150601.1	20	80000	0
969	0	22730	22730	KN150602.1	20	80000	0
970	0	98280	98280	KN150603.1	20	80000	0
971	0	25236	25236	KN150604.1	20	80000	0
972	0	102574	102574	KN150605.1	20	80000	0
973	0	51696	51696	KN150606.1	20	80000	0
974	0	9531	9531	KN150607.1	20	80000	0
975	0	149650	149650	KN150608.1	20	80000	0
976	0	37413	37413	KN150609.1	20	80000	0
977	0	10565	10565	KN150610.1	20	80000	0
978	0	1697	1697	KN150611.1	20	80000	0
979	0	2865	2865	KN150612.1	20	80000	0
980	0	15739	15739	KN150613.1	20	80000	0
981	0	9019	9019	KN150614.1	20	80000	0
982	0	9878	9878	KN150615.1	20	80000	0
983	0	88699	88699	KN150616.1	20	80000	0
984	0	90208	90208	KN150617.1	20	80000	0
985	0	64127	64127	KN150618.1	20	80000	0
986	0	41925	41925	KN150619.1	20	80000	0
987	0	30729	30729	KN150620.1	20	80000	0
988	0	1204	1204	KN150621.1	20	80000	0
989	0	15811	15811	KN150622.1	20	80000	0
990	0	1126	1126	KN150623.1	20	80000	0
991	0	18713	18713	KN150624.1	20	80000	0
992	0	22486	22486	KN150625.1	20	80000	0
993	0	32850	32850	KN150626.1	20	80000	0
994	0	26060	26060	KN150627.1	20	80000	0
995	0	33906	33906	KN150628.1	20	80000	0
996	0	19604	19604	KN150629.1	20	80000	0
997	0	86421	86421	KN150630.1	20	80000	0
998	0	36324	36324	KN150631.1	20	80000	0
999	0	11627	11627	KN150632.1	20	80000	0
1000	0	19558	19558	KN150633.1	20	80000	0
1001	0	16020	16020	KN150634.1	20	80000	0
1002	0	27947	27947	KN150635.1	20	80000	0
1003	0	20513	20513	KN150636.1	20	80000	0
1004	0	39689	39689	KN150637.1	20	80000	0
1005	0	39727	39727	KN150638.1	20	80000	0
1006	0	27620	27620	KN150639.1	20	80000	0
1007	0	20890	20890	KN150640.1	20	80000	0
1008	0	14778	14778	KN150641.1	20	80000	0
1009	0	55536	55536	KN150642.1	20	80000	0
1010	0	28088	28088	KN150643.1	20	80000	0
1011	0	20534	20534	KN150644.1	20	80000	0
1012	0	22839	22839	KN150645.1	20	80000	0
1013	0	78076	78076	KN150646.1	20	80000	0
1014	0	14938	14938	KN150647.1	20	80000	0
1015	0	2077	2077	KN150648.1	20	80000	0
1016	0	81249	81249	KN150649.1	20	80000	0
1017	0	3012	3012	KN150650.1	20	80000	0
1018	0	28018	28018	KN150651.1	20	80000	0
1019	0	18075	18075	KN150652.1	20	80000	0
1020	0	55997	55997	KN150653.1	20	80000	0
1021	0	18414	18414	KN150654.1	20	80000	0
1022	0	8089	8089	KN150655.1	20	80000	0
1023	0	28006	28006	KN150656.1	20	80000	0
1024	0	1007	1007	KN150657.1	20	80000	0
1025	0	90387	90387	KN150658.1	20	80000	0
1026	0	11827	11827	KN150659.1	20	80000	0
1027	0	13470	13470	KN150660.1	20	80000	0
1028	0	26250	26250	KN150661.1	20	80000	0
1029	0	17820	17820	KN150662.1	20	80000	0
1030	0	88608	88608	KN150663.1	20	80000	0
1031	0	9590	9590	KN150664.1	20	80000	0
1032	0	11944	11944	KN150665.1	20	80000	0
1033	0	63484	63484	KN150666.1	20	80000	0
1034	0	54201	54201	KN150667.1	20	80000	0
1035	0	21856	21856	KN150668.1	20	80000	0
1036	0	15325	15325	KN150669.1	20	80000	0
1037	0	77993	77993	KN150670.1	20	80000	0
1038	0	13526	13526	KN150671.1	20	80000	0
1039	0	107610	107610	KN150672.1	20	80000	0
1040	0	3357	3357	KN150673.1	20	80000	0
1041	0	13959	13959	KN150674.1	20	80000	0
1042	0	41858	41858	KN150675.1	20	80000	0
1043	0	51674	51674	KN150676.1	20	80000	0
1044	0	66956	66956	KN150677.1	20	80000	0
1045	0	7552	7552	KN150678.1	20	80000	0
1046	0	14065	14065	KN150679.1	20	80000	0
1047	0	13379	13379	KN150680.1	20	80000	0
1048	0	279222	279222	KN150681.1	20	80000	0
1049	0	15190	15190	KN150682.1	20	80000	0
1050	0	16822	16822	KN150683.1	20	80000	0
1051	0	24053	24053	KN150684.1	20	80000	0
1052	0	13309	13309	KN150685.1	20	80000	0
1053	0	11947	11947	KN150686.1	20	80000	0
1054	0	13294	13294	KN150687.1	20	80000	0
1055	0	1917	1917	KN150688.1	20	80000	0
1056	0	19550	19550	KN150689.1	20	80000	0
1057	0	26145	26145	KN150690.1	20	80000	0
1058	0	184625	184625	KN150691.1	20	80000	0
1059	0	12590	12590	KN150692.1	20	80000	0
1060	0	2190	2190	KN150693.1	20	80000	0
1061	0	13510	13510	KN150694.1	20	80000	0
1062	0	14840	14840	KN150695.1	20	80000	0
1063	0	29565	29565	KN150696.1	20	80000	0
1064	0	12709	12709	KN150697.1	20	80000	0
1065	0	31983	31983	KN150698.1	20	80000	0
1066	0	26100	26100	KN150699.1	20	80000	0
1067	0	79542	79542	KN150700.1	20	80000	0
1068	0	1133	1133	KN150701.1	20	80000	0
1069	0	212296	212296	KN150702.1	20	80000	0
1070	0	48009	48009	KN150703.1	20	80000	0
1071	0	1233	1233	KN150704.1	20	80000	0
1072	0	16373	16373	KN150705.1	20	80000	0
1073	0	8278	8278	KN150706.1	20	80000	0
1074	0	16938	16938	KN150707.1	20	80000	0
1075	0	42677	42677	KN150708.1	20	80000	0
1076	0	65370	65370	KN150709.1	20	80000	0
1077	0	19629	19629	KN150710.1	20	80000	0
1078	0	11940	11940	KN150711.1	20	80000	0
1079	0	79012	79012	KN150712.1	20	80000	0
1080	0	14579	14579	KN150713.1	20	80000	0
1081	0	16596	16596	MT	20	80000	0
1123	0	248956422	248956422	1	1122	80000	0
1124	0	133797422	133797422	10	1122	80000	0
1125	0	135086622	135086622	11	1122	80000	0
1126	0	133275309	133275309	12	1122	80000	0
1127	0	114364328	114364328	13	1122	80000	0
1128	0	107043718	107043718	14	1122	80000	0
1129	0	101991189	101991189	15	1122	80000	0
1130	0	90338345	90338345	16	1122	80000	0
1131	0	83257441	83257441	17	1122	80000	0
1132	0	80373285	80373285	18	1122	80000	0
1133	0	58617616	58617616	19	1122	80000	0
1134	0	242193529	242193529	2	1122	80000	0
1135	0	64444167	64444167	20	1122	80000	0
1136	0	46709983	46709983	21	1122	80000	0
1137	0	50818468	50818468	22	1122	80000	0
1138	0	198295559	198295559	3	1122	80000	0
1139	0	190214555	190214555	4	1122	80000	0
1140	0	181538259	181538259	5	1122	80000	0
1141	0	170805979	170805979	6	1122	80000	0
1142	0	159345973	159345973	7	1122	80000	0
1143	0	145138636	145138636	8	1122	80000	0
1144	0	138394717	138394717	9	1122	80000	0
1145	0	16571	16571	MT	1122	80000	0
1146	0	156040895	156040895	X	1122	80000	0
1147	0	57227415	57227415	Y	1122	80000	0
1150	0	195471971	195471971	1	1149	80000	0
1151	0	130694993	130694993	10	1149	80000	0
1152	0	122082543	122082543	11	1149	80000	0
1153	0	120129022	120129022	12	1149	80000	0
1154	0	120421639	120421639	13	1149	80000	0
1155	0	124902244	124902244	14	1149	80000	0
1156	0	104043685	104043685	15	1149	80000	0
1157	0	98207768	98207768	16	1149	80000	0
1158	0	94987271	94987271	17	1149	80000	0
1159	0	90702639	90702639	18	1149	80000	0
1160	0	61431566	61431566	19	1149	80000	0
1161	0	182113224	182113224	2	1149	80000	0
1162	0	160039680	160039680	3	1149	80000	0
1163	0	156508116	156508116	4	1149	80000	0
1164	0	151834684	151834684	5	1149	80000	0
1165	0	149736546	149736546	6	1149	80000	0
1166	0	145441459	145441459	7	1149	80000	0
1167	0	129401213	129401213	8	1149	80000	0
1168	0	124595110	124595110	9	1149	80000	0
1169	0	171031299	171031299	X	1149	80000	0
1170	0	91744698	91744698	Y	1149	80000	0
1171	0	16299	16299	MT	1149	80000	0
1199	0	230218	230218	chrI	1198	80000	0
1200	0	813184	813184	chrII	1198	80000	0
1201	0	316620	316620	chrIII	1198	80000	0
1202	0	1531933	1531933	chrIV	1198	80000	0
1203	0	439888	439888	chrIX	1198	80000	0
1204	0	576874	576874	chrV	1198	80000	0
1205	0	270161	270161	chrVI	1198	80000	0
1206	0	1090940	1090940	chrVII	1198	80000	0
1207	0	562643	562643	chrVIII	1198	80000	0
1208	0	745751	745751	chrX	1198	80000	0
1209	0	666816	666816	chrXI	1198	80000	0
1210	0	1078177	1078177	chrXII	1198	80000	0
1211	0	924431	924431	chrXIII	1198	80000	0
1212	0	784333	784333	chrXIV	1198	80000	0
1213	0	1091291	1091291	chrXV	1198	80000	0
1214	0	948066	948066	chrXVI	1198	80000	0
1215	0	85779	85779	chrmt	1198	80000	0
1174	0	282763074	282763074	1	1173	80000	0
1175	0	112626471	112626471	10	1173	80000	0
1176	0	90463843	90463843	11	1173	80000	0
1177	0	52716770	52716770	12	1173	80000	0
1178	0	114033958	114033958	13	1173	80000	0
1179	0	115493446	115493446	14	1173	80000	0
1180	0	111246239	111246239	15	1173	80000	0
1181	0	90668790	90668790	16	1173	80000	0
1182	0	90843779	90843779	17	1173	80000	0
1183	0	88201929	88201929	18	1173	80000	0
1184	0	62275575	62275575	19	1173	80000	0
1185	0	266435125	266435125	2	1173	80000	0
1186	0	56205956	56205956	20	1173	80000	0
1187	0	177699992	177699992	3	1173	80000	0
1188	0	184226339	184226339	4	1173	80000	0
1189	0	173707219	173707219	5	1173	80000	0
1190	0	147991367	147991367	6	1173	80000	0
1191	0	145729302	145729302	7	1173	80000	0
1192	0	133307652	133307652	8	1173	80000	0
1193	0	122095297	122095297	9	1173	80000	0
1194	0	16313	16313	MT	1173	80000	0
1195	0	159970021	159970021	X	1173	80000	0
1196	0	3310458	3310458	Y	1173	80000	0
920917	0	29903	29903	NC_045512.2	920915	80000	0
\.


--
-- Data for Name: sequence_cache; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.sequence_cache (id, version, feature_name, fmax, fmin, organism_name, param_map, response, sequence_name, type) FROM stdin;
\.


--
-- Data for Name: sequence_chunk; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.sequence_chunk (id, version, chunk_number, residue, sequence_id) FROM stdin;
\.


--
-- Data for Name: server_data; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.server_data (id, version, date_created, last_updated, name) FROM stdin;
1	0	2017-09-29 18:49:44.772	2017-09-29 18:49:44.772	ApolloSever-1854386537133343801407552405
\.


--
-- Data for Name: suggested_name; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.suggested_name (id, version, metadata, name) FROM stdin;
\.


--
-- Data for Name: suggested_name_feature_type; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.suggested_name_feature_type (suggested_name_feature_types_id, feature_type_id) FROM stdin;
\.


--
-- Data for Name: synonym; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.synonym (id, version, name) FROM stdin;
\.


--
-- Data for Name: track_cache; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.track_cache (id, version, feature_name, fmax, fmin, organism_name, param_map, response, sequence_name, track_name, type) FROM stdin;
\.


--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.user_group (id, version, name, public_group, metadata) FROM stdin;
\.


--
-- Data for Name: user_group_admin; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.user_group_admin (user_id, user_group_id) FROM stdin;
\.


--
-- Data for Name: user_group_users; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.user_group_users (user_id, user_group_id) FROM stdin;
\.


--
-- Data for Name: variant_info; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.variant_info (id, version, tag, value, variant_id) FROM stdin;
\.


--
-- Data for Name: with_or_from; Type: TABLE DATA; Schema: public; Owner: apollo2_user
--

COPY public.with_or_from (id, version, lookup_id, prefix) FROM stdin;
\.


--
-- Name: allele_info_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.allele_info
    ADD CONSTRAINT allele_info_pkey PRIMARY KEY (id);


--
-- Name: allele_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.allele
    ADD CONSTRAINT allele_pkey PRIMARY KEY (id);


--
-- Name: analysis_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.analysis_feature
    ADD CONSTRAINT analysis_feature_pkey PRIMARY KEY (id);


--
-- Name: analysis_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.analysis
    ADD CONSTRAINT analysis_pkey PRIMARY KEY (id);


--
-- Name: analysis_property_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.analysis_property
    ADD CONSTRAINT analysis_property_pkey PRIMARY KEY (id);


--
-- Name: application_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.application_preference
    ADD CONSTRAINT application_preference_pkey PRIMARY KEY (id);


--
-- Name: audit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (id);


--
-- Name: available_status_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.available_status
    ADD CONSTRAINT available_status_pkey PRIMARY KEY (id);


--
-- Name: canned_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.canned_comment
    ADD CONSTRAINT canned_comment_pkey PRIMARY KEY (id);


--
-- Name: canned_key_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.canned_key
    ADD CONSTRAINT canned_key_pkey PRIMARY KEY (id);


--
-- Name: canned_value_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.canned_value
    ADD CONSTRAINT canned_value_pkey PRIMARY KEY (id);


--
-- Name: custom_domain_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.custom_domain_mapping
    ADD CONSTRAINT custom_domain_mapping_pkey PRIMARY KEY (id);


--
-- Name: cv_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cv
    ADD CONSTRAINT cv_pkey PRIMARY KEY (id);


--
-- Name: cvterm_path_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm_path
    ADD CONSTRAINT cvterm_path_pkey PRIMARY KEY (id);


--
-- Name: cvterm_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm
    ADD CONSTRAINT cvterm_pkey PRIMARY KEY (id);


--
-- Name: cvterm_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm_relationship
    ADD CONSTRAINT cvterm_relationship_pkey PRIMARY KEY (id);


--
-- Name: data_adapter_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.data_adapter
    ADD CONSTRAINT data_adapter_pkey PRIMARY KEY (id);


--
-- Name: db_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.db
    ADD CONSTRAINT db_pkey PRIMARY KEY (id);


--
-- Name: dbxref_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.dbxref
    ADD CONSTRAINT dbxref_pkey PRIMARY KEY (id);


--
-- Name: dbxref_property_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.dbxref_property
    ADD CONSTRAINT dbxref_property_pkey PRIMARY KEY (id);


--
-- Name: environment_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.environment
    ADD CONSTRAINT environment_pkey PRIMARY KEY (id);


--
-- Name: environmentcvterm_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.environmentcvterm
    ADD CONSTRAINT environmentcvterm_pkey PRIMARY KEY (id);


--
-- Name: feature_event_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_event
    ADD CONSTRAINT feature_event_pkey PRIMARY KEY (id);


--
-- Name: feature_feature_phenotypes_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_feature_phenotypes
    ADD CONSTRAINT feature_feature_phenotypes_pkey PRIMARY KEY (feature_id, phenotype_id);


--
-- Name: feature_genotype_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_genotype
    ADD CONSTRAINT feature_genotype_pkey PRIMARY KEY (id);


--
-- Name: feature_location_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_location
    ADD CONSTRAINT feature_location_pkey PRIMARY KEY (id);


--
-- Name: feature_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT feature_pkey PRIMARY KEY (id);


--
-- Name: feature_property_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_property
    ADD CONSTRAINT feature_property_pkey PRIMARY KEY (id);


--
-- Name: feature_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_relationship
    ADD CONSTRAINT feature_relationship_pkey PRIMARY KEY (id);


--
-- Name: feature_synonym_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_synonym
    ADD CONSTRAINT feature_synonym_pkey PRIMARY KEY (id);


--
-- Name: feature_type_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_type
    ADD CONSTRAINT feature_type_pkey PRIMARY KEY (id);


--
-- Name: featurecvterm_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.featurecvterm
    ADD CONSTRAINT featurecvterm_pkey PRIMARY KEY (id);


--
-- Name: genotype_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.genotype
    ADD CONSTRAINT genotype_pkey PRIMARY KEY (id);


--
-- Name: go_annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.go_annotation
    ADD CONSTRAINT go_annotation_pkey PRIMARY KEY (id);


--
-- Name: go_term_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.go_term
    ADD CONSTRAINT go_term_pkey PRIMARY KEY (id);


--
-- Name: grails_user_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.grails_user
    ADD CONSTRAINT grails_user_pkey PRIMARY KEY (id);


--
-- Name: grails_user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.grails_user_roles
    ADD CONSTRAINT grails_user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: operation_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_pkey PRIMARY KEY (id);


--
-- Name: organism_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_filter
    ADD CONSTRAINT organism_filter_pkey PRIMARY KEY (id);


--
-- Name: organism_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism
    ADD CONSTRAINT organism_pkey PRIMARY KEY (id);


--
-- Name: organism_property_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_property
    ADD CONSTRAINT organism_property_pkey PRIMARY KEY (id);


--
-- Name: organismdbxref_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organismdbxref
    ADD CONSTRAINT organismdbxref_pkey PRIMARY KEY (id);


--
-- Name: part_of_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.part_of
    ADD CONSTRAINT part_of_pkey PRIMARY KEY (id);


--
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: phenotype_description_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_description
    ADD CONSTRAINT phenotype_description_pkey PRIMARY KEY (id);


--
-- Name: phenotype_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype
    ADD CONSTRAINT phenotype_pkey PRIMARY KEY (id);


--
-- Name: phenotype_statement_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_statement
    ADD CONSTRAINT phenotype_statement_pkey PRIMARY KEY (id);


--
-- Name: pk_databasechangelog; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.databasechangelog
    ADD CONSTRAINT pk_databasechangelog PRIMARY KEY (id, author, filename);


--
-- Name: pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: preference_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.preference
    ADD CONSTRAINT preference_pkey PRIMARY KEY (id);


--
-- Name: proxy_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.proxy
    ADD CONSTRAINT proxy_pkey PRIMARY KEY (id);


--
-- Name: publication_author_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publication_author
    ADD CONSTRAINT publication_author_pkey PRIMARY KEY (id);


--
-- Name: publication_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publication
    ADD CONSTRAINT publication_pkey PRIMARY KEY (id);


--
-- Name: publication_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publication_relationship
    ADD CONSTRAINT publication_relationship_pkey PRIMARY KEY (id);


--
-- Name: publicationdbxref_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publicationdbxref
    ADD CONSTRAINT publicationdbxref_pkey PRIMARY KEY (id);


--
-- Name: reference_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: search_tool_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.search_tool
    ADD CONSTRAINT search_tool_pkey PRIMARY KEY (id);


--
-- Name: sequence_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.sequence_cache
    ADD CONSTRAINT sequence_cache_pkey PRIMARY KEY (id);


--
-- Name: sequence_chunk_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.sequence_chunk
    ADD CONSTRAINT sequence_chunk_pkey PRIMARY KEY (id);


--
-- Name: sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT sequence_pkey PRIMARY KEY (id);


--
-- Name: server_data_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.server_data
    ADD CONSTRAINT server_data_pkey PRIMARY KEY (id);


--
-- Name: suggested_name_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.suggested_name
    ADD CONSTRAINT suggested_name_pkey PRIMARY KEY (id);


--
-- Name: synonym_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.synonym
    ADD CONSTRAINT synonym_pkey PRIMARY KEY (id);


--
-- Name: track_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.track_cache
    ADD CONSTRAINT track_cache_pkey PRIMARY KEY (id);


--
-- Name: uk_1uxpq87pyp6d4vp86es3ew5lf; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_1uxpq87pyp6d4vp86es3ew5lf UNIQUE (rank);


--
-- Name: uk_3mkho1p232es23vtaqp0obydb; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.db
    ADD CONSTRAINT uk_3mkho1p232es23vtaqp0obydb UNIQUE (name);


--
-- Name: uk_75vf8prrwqnurcllgi892v8qg; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.server_data
    ADD CONSTRAINT uk_75vf8prrwqnurcllgi892v8qg UNIQUE (name);


--
-- Name: uk_8mry59fk655ec8pilksknkjxd; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.application_preference
    ADD CONSTRAINT uk_8mry59fk655ec8pilksknkjxd UNIQUE (name);


--
-- Name: uk_8sewwnpamngi6b1dwaa88askk; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_8sewwnpamngi6b1dwaa88askk UNIQUE (name);


--
-- Name: uk_rdmcxcj6i53kfjmb9j811ta1m; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.grails_user
    ADD CONSTRAINT uk_rdmcxcj6i53kfjmb9j811ta1m UNIQUE (username);


--
-- Name: user_group_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.user_group_admin
    ADD CONSTRAINT user_group_admin_pkey PRIMARY KEY (user_group_id, user_id);


--
-- Name: user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (id);


--
-- Name: user_group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.user_group_users
    ADD CONSTRAINT user_group_users_pkey PRIMARY KEY (user_group_id, user_id);


--
-- Name: variant_info_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.variant_info
    ADD CONSTRAINT variant_info_pkey PRIMARY KEY (id);


--
-- Name: with_or_from_pkey; Type: CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.with_or_from
    ADD CONSTRAINT with_or_from_pkey PRIMARY KEY (id);


--
-- Name: feature_uniquename; Type: INDEX; Schema: public; Owner: apollo2_user
--

CREATE INDEX feature_uniquename ON public.feature_event USING btree (unique_name);


--
-- Name: fk_1kkkx1uxs6li0r72qhvke6o77; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_description
    ADD CONSTRAINT fk_1kkkx1uxs6li0r72qhvke6o77 FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_1mrfkxbb3n7fhjxcrkxappdn8; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_dbxref
    ADD CONSTRAINT fk_1mrfkxbb3n7fhjxcrkxappdn8 FOREIGN KEY (feature_featuredbxrefs_id) REFERENCES public.feature(id);


--
-- Name: fk_1p7u7j0his3pnmk95eataomue; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.suggested_name_feature_type
    ADD CONSTRAINT fk_1p7u7j0his3pnmk95eataomue FOREIGN KEY (feature_type_id) REFERENCES public.feature_type(id);


--
-- Name: fk_1ykkgglhecw7pina70hxhrhkf; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_filter
    ADD CONSTRAINT fk_1ykkgglhecw7pina70hxhrhkf FOREIGN KEY (canned_comment_id) REFERENCES public.canned_comment(id);


--
-- Name: fk_321276juoco9ijc32gxeo7mi9; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.data_adapter_data_adapter
    ADD CONSTRAINT fk_321276juoco9ijc32gxeo7mi9 FOREIGN KEY (data_adapter_data_adapters_id) REFERENCES public.data_adapter(id);


--
-- Name: fk_35nc3xd2axx6fwyap4bjkt09u; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_event
    ADD CONSTRAINT fk_35nc3xd2axx6fwyap4bjkt09u FOREIGN KEY (editor_id) REFERENCES public.grails_user(id);


--
-- Name: fk_36e638geg9tew42b1mp2ehff; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_property
    ADD CONSTRAINT fk_36e638geg9tew42b1mp2ehff FOREIGN KEY (type_id) REFERENCES public.cvterm(id);


--
-- Name: fk_38g8n4bitmdwkrcs217uexrwx; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.analysis_property
    ADD CONSTRAINT fk_38g8n4bitmdwkrcs217uexrwx FOREIGN KEY (analysis_id) REFERENCES public.analysis(id);


--
-- Name: fk_39svd38qq78gxs0idnu5yiorc; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_filter
    ADD CONSTRAINT fk_39svd38qq78gxs0idnu5yiorc FOREIGN KEY (available_status_id) REFERENCES public.available_status(id);


--
-- Name: fk_3a9j1mryggb0bcaguvkhw8hjm; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.featurecvterm_publication
    ADD CONSTRAINT fk_3a9j1mryggb0bcaguvkhw8hjm FOREIGN KEY (featurecvterm_featurecvterm_publications_id) REFERENCES public.featurecvterm(id);


--
-- Name: fk_3p1ssctww083s0tt65mmm64uo; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.dbxref_property
    ADD CONSTRAINT fk_3p1ssctww083s0tt65mmm64uo FOREIGN KEY (dbxref_id) REFERENCES public.dbxref(id);


--
-- Name: fk_3r7k0qnsbmp0hbe94kpnexb8u; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.canned_value_feature_type
    ADD CONSTRAINT fk_3r7k0qnsbmp0hbe94kpnexb8u FOREIGN KEY (canned_value_feature_types_id) REFERENCES public.canned_value(id);


--
-- Name: fk_3rtkicqpr3ca8dwivye3yajaa; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_property_organism_property
    ADD CONSTRAINT fk_3rtkicqpr3ca8dwivye3yajaa FOREIGN KEY (organism_property_organism_properties_id) REFERENCES public.organism_property(id);


--
-- Name: fk_42b0lk4rcfjcagw84jugd1sgj; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.preference
    ADD CONSTRAINT fk_42b0lk4rcfjcagw84jugd1sgj FOREIGN KEY (organism_id) REFERENCES public.organism(id);


--
-- Name: fk_4dgbhgiw0vb9hqy2k5fqg3neh; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_grails_user
    ADD CONSTRAINT fk_4dgbhgiw0vb9hqy2k5fqg3neh FOREIGN KEY (feature_owners_id) REFERENCES public.feature(id);


--
-- Name: fk_4j4u29xis9bhr65slfaimgjye; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_relationship_publication
    ADD CONSTRAINT fk_4j4u29xis9bhr65slfaimgjye FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_4mxkyj2itw9wyvcn6d8d4mta2; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.grails_user_roles
    ADD CONSTRAINT fk_4mxkyj2itw9wyvcn6d8d4mta2 FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: fk_4nvoxx3htem6jseb4rmu0aqfp; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT fk_4nvoxx3htem6jseb4rmu0aqfp FOREIGN KEY (organism_id) REFERENCES public.organism(id);


--
-- Name: fk_4tsu0cp2dh2avbxifp1h1c9vd; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.sequence_chunk
    ADD CONSTRAINT fk_4tsu0cp2dh2avbxifp1h1c9vd FOREIGN KEY (sequence_id) REFERENCES public.sequence(id);


--
-- Name: fk_580odgbjowisfshvk82rfjri2; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_publication
    ADD CONSTRAINT fk_580odgbjowisfshvk82rfjri2 FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_6d097oy44230tuoo8lb8dkkcp; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm
    ADD CONSTRAINT fk_6d097oy44230tuoo8lb8dkkcp FOREIGN KEY (dbxref_id) REFERENCES public.dbxref(id);


--
-- Name: fk_6p3mx8al2w4f7ltqiwf1j88fm; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT fk_6p3mx8al2w4f7ltqiwf1j88fm FOREIGN KEY (user_id) REFERENCES public.grails_user(id);


--
-- Name: fk_72kmd92rdc6gne0nrh026o1j0; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_relationship
    ADD CONSTRAINT fk_72kmd92rdc6gne0nrh026o1j0 FOREIGN KEY (parent_feature_id) REFERENCES public.feature(id);


--
-- Name: fk_736wxgjs6pip5212ash5i68p; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_genotype
    ADD CONSTRAINT fk_736wxgjs6pip5212ash5i68p FOREIGN KEY (genotype_id) REFERENCES public.genotype(id);


--
-- Name: fk_7huaou2aj3ac3oa49c1e0nhlm; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT fk_7huaou2aj3ac3oa49c1e0nhlm FOREIGN KEY (analysis_feature_id) REFERENCES public.analysis_feature(id);


--
-- Name: fk_82wsc3bv9i01t9851xv4xekis; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_synonym
    ADD CONSTRAINT fk_82wsc3bv9i01t9851xv4xekis FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_86law9p6s1pbt02n3mltkcqwh; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_property_publication
    ADD CONSTRAINT fk_86law9p6s1pbt02n3mltkcqwh FOREIGN KEY (feature_property_feature_property_publications_id) REFERENCES public.feature_property(id);


--
-- Name: fk_8jm56covt0m7m0m191bc5jseh; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_relationship
    ADD CONSTRAINT fk_8jm56covt0m7m0m191bc5jseh FOREIGN KEY (child_feature_id) REFERENCES public.feature(id);


--
-- Name: fk_8jxbx51qysqlm07orah5xg45y; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_property_organism_property
    ADD CONSTRAINT fk_8jxbx51qysqlm07orah5xg45y FOREIGN KEY (organism_property_id) REFERENCES public.organism_property(id);


--
-- Name: fk_8l290fdei9m707s7ngn712sts; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.canned_comment_feature_type
    ADD CONSTRAINT fk_8l290fdei9m707s7ngn712sts FOREIGN KEY (canned_comment_feature_types_id) REFERENCES public.canned_comment(id);


--
-- Name: fk_8m30ycwh545b4aoxor9sbk1oq; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.analysis_feature
    ADD CONSTRAINT fk_8m30ycwh545b4aoxor9sbk1oq FOREIGN KEY (analysis_id) REFERENCES public.analysis(id);


--
-- Name: fk_8pbyj05khavdl5a648c7pmcil; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_description
    ADD CONSTRAINT fk_8pbyj05khavdl5a648c7pmcil FOREIGN KEY (type_id) REFERENCES public.cvterm(id);


--
-- Name: fk_8rbhsxxdf669tyed8jrr747hv; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_statement
    ADD CONSTRAINT fk_8rbhsxxdf669tyed8jrr747hv FOREIGN KEY (genotype_id) REFERENCES public.genotype(id);


--
-- Name: fk_97qgrmdull1avkfqpfq1mc1wt; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publication_relationship
    ADD CONSTRAINT fk_97qgrmdull1avkfqpfq1mc1wt FOREIGN KEY (object_publication_id) REFERENCES public.publication(id);


--
-- Name: fk_9e2v7goj5w6nds5jo0x1va1nm; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_cvterm
    ADD CONSTRAINT fk_9e2v7goj5w6nds5jo0x1va1nm FOREIGN KEY (cvterm_id) REFERENCES public.cvterm(id);


--
-- Name: fk_9eou8yof43krmrsdvfhfuisln; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publication_author
    ADD CONSTRAINT fk_9eou8yof43krmrsdvfhfuisln FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_9jib0g899h0gy3dypo7datfm9; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.user_group_users
    ADD CONSTRAINT fk_9jib0g899h0gy3dypo7datfm9 FOREIGN KEY (user_group_id) REFERENCES public.user_group(id);


--
-- Name: fk_9o7xs7saygim8y0sm4ostvpc1; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.analysis_property
    ADD CONSTRAINT fk_9o7xs7saygim8y0sm4ostvpc1 FOREIGN KEY (type_id) REFERENCES public.cvterm(id);


--
-- Name: fk_aicsmj1kn20ikm14292g9r2j9; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_cvterm
    ADD CONSTRAINT fk_aicsmj1kn20ikm14292g9r2j9 FOREIGN KEY (phenotype_phenotypecvterms_id) REFERENCES public.phenotype(id);


--
-- Name: fk_aqr7eiyx6puju6elciwubbwmo; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_feature_phenotypes
    ADD CONSTRAINT fk_aqr7eiyx6puju6elciwubbwmo FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: fk_avbwcwpfh7xi4wxms35t7cbti; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.go_annotation_grails_user
    ADD CONSTRAINT fk_avbwcwpfh7xi4wxms35t7cbti FOREIGN KEY (go_annotation_owners_id) REFERENCES public.go_annotation(id);


--
-- Name: fk_b42u9iq4kuqe5ay544do81n32; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_genotype
    ADD CONSTRAINT fk_b42u9iq4kuqe5ay544do81n32 FOREIGN KEY (cvterm_id) REFERENCES public.cvterm(id);


--
-- Name: fk_bdd324e5jb0lpuhs7biy2kacm; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_relationship_publication
    ADD CONSTRAINT fk_bdd324e5jb0lpuhs7biy2kacm FOREIGN KEY (feature_relationship_feature_relationship_publications_id) REFERENCES public.feature_relationship(id);


--
-- Name: fk_bf1bstadamyw0gsarkb933l5b; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_description
    ADD CONSTRAINT fk_bf1bstadamyw0gsarkb933l5b FOREIGN KEY (genotype_id) REFERENCES public.genotype(id);


--
-- Name: fk_c5a2cdstwj0ydibnu567urh7q; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.data_adapter_data_adapter
    ADD CONSTRAINT fk_c5a2cdstwj0ydibnu567urh7q FOREIGN KEY (data_adapter_id) REFERENCES public.data_adapter(id);


--
-- Name: fk_cm3gqs38fa2lpllgoum8n4kgn; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_genotype
    ADD CONSTRAINT fk_cm3gqs38fa2lpllgoum8n4kgn FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: fk_cuwo3ernssd0t0wjceb7lmm11; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.featurecvterm
    ADD CONSTRAINT fk_cuwo3ernssd0t0wjceb7lmm11 FOREIGN KEY (cvterm_id) REFERENCES public.cvterm(id);


--
-- Name: fk_cwgh6naf9gackae2ei11v6p41; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype
    ADD CONSTRAINT fk_cwgh6naf9gackae2ei11v6p41 FOREIGN KEY (assay_id) REFERENCES public.cvterm(id);


--
-- Name: fk_d4atqq8ege1sij0316vh2mxfu; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT fk_d4atqq8ege1sij0316vh2mxfu FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: fk_dhnrehn3tj85m2j9c0m4md3f4; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_location
    ADD CONSTRAINT fk_dhnrehn3tj85m2j9c0m4md3f4 FOREIGN KEY (sequence_id) REFERENCES public.sequence(id);


--
-- Name: fk_dnofis69fbieijg6f562lv4f2; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.available_status_feature_type
    ADD CONSTRAINT fk_dnofis69fbieijg6f562lv4f2 FOREIGN KEY (feature_type_id) REFERENCES public.feature_type(id);


--
-- Name: fk_dy5g29heir5ic3d36okyuihho; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_feature_phenotypes
    ADD CONSTRAINT fk_dy5g29heir5ic3d36okyuihho FOREIGN KEY (phenotype_id) REFERENCES public.phenotype(id);


--
-- Name: fk_e1wsvc8s3bf4rpq0v664hpw9x; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.variant_info
    ADD CONSTRAINT fk_e1wsvc8s3bf4rpq0v664hpw9x FOREIGN KEY (variant_id) REFERENCES public.feature(id);


--
-- Name: fk_e85bethukbu93d3whx6shl3xi; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.canned_value_feature_type
    ADD CONSTRAINT fk_e85bethukbu93d3whx6shl3xi FOREIGN KEY (feature_type_id) REFERENCES public.feature_type(id);


--
-- Name: fk_ebgnfbogf1lwdxd8jc17511o7; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_relationship_feature_property
    ADD CONSTRAINT fk_ebgnfbogf1lwdxd8jc17511o7 FOREIGN KEY (feature_relationship_feature_relationship_properties_id) REFERENCES public.feature_relationship(id);


--
-- Name: fk_es9vpf57b7a14sv803xy64k8h; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.canned_comment_feature_type
    ADD CONSTRAINT fk_es9vpf57b7a14sv803xy64k8h FOREIGN KEY (feature_type_id) REFERENCES public.feature_type(id);


--
-- Name: fk_etqcuqd8bk3atmmxit0gul1q; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_filter
    ADD CONSTRAINT fk_etqcuqd8bk3atmmxit0gul1q FOREIGN KEY (suggested_name_id) REFERENCES public.suggested_name(id);


--
-- Name: fk_euu6xx78omdvver8lij1ys2oq; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publication_relationship
    ADD CONSTRAINT fk_euu6xx78omdvver8lij1ys2oq FOREIGN KEY (subject_publication_id) REFERENCES public.publication(id);


--
-- Name: fk_f1e1d91q04mqaij1ep3s36ujl; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_organism_property
    ADD CONSTRAINT fk_f1e1d91q04mqaij1ep3s36ujl FOREIGN KEY (organism_property_id) REFERENCES public.organism_property(id);


--
-- Name: fk_g48bxstocv037qt6sxvc3bda6; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.canned_key_feature_type
    ADD CONSTRAINT fk_g48bxstocv037qt6sxvc3bda6 FOREIGN KEY (feature_type_id) REFERENCES public.feature_type(id);


--
-- Name: fk_g6l9cr99p5dhb0kvs9y0tjwnv; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.featurecvterm_publication
    ADD CONSTRAINT fk_g6l9cr99p5dhb0kvs9y0tjwnv FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_gb4wy9qesx6vnekxekm18k9xa; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype
    ADD CONSTRAINT fk_gb4wy9qesx6vnekxekm18k9xa FOREIGN KEY (observable_id) REFERENCES public.cvterm(id);


--
-- Name: fk_gskh1e7b6qa2du48ayu49lr3s; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_statement
    ADD CONSTRAINT fk_gskh1e7b6qa2du48ayu49lr3s FOREIGN KEY (phenotype_id) REFERENCES public.phenotype(id);


--
-- Name: fk_gsol4u8wrfwbkh1qrx18i3u6; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_synonym
    ADD CONSTRAINT fk_gsol4u8wrfwbkh1qrx18i3u6 FOREIGN KEY (feature_synonyms_id) REFERENCES public.feature(id);


--
-- Name: fk_h3g8f3q2krcnwmq2nasbanlay; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publication
    ADD CONSTRAINT fk_h3g8f3q2krcnwmq2nasbanlay FOREIGN KEY (type_id) REFERENCES public.cvterm(id);


--
-- Name: fk_hak8r429shmpho06rbyvwnmt0; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_genotype
    ADD CONSTRAINT fk_hak8r429shmpho06rbyvwnmt0 FOREIGN KEY (chromosome_feature_id) REFERENCES public.feature(id);


--
-- Name: fk_hc4vrafs0ws7ugdkp0n6u3xdo; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT fk_hc4vrafs0ws7ugdkp0n6u3xdo FOREIGN KEY (dbxref_id) REFERENCES public.dbxref(id);


--
-- Name: fk_hffc43aavltp8t5dtwactux5f; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_statement
    ADD CONSTRAINT fk_hffc43aavltp8t5dtwactux5f FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_hycx5el5itt1lqidt532shkpj; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT fk_hycx5el5itt1lqidt532shkpj FOREIGN KEY (group_id) REFERENCES public.user_group(id);


--
-- Name: fk_i94ksmdxi88hcqnuycebgkdvs; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.preference
    ADD CONSTRAINT fk_i94ksmdxi88hcqnuycebgkdvs FOREIGN KEY (sequence_id) REFERENCES public.sequence(id);


--
-- Name: fk_iy7bbt67s7jaemiajsrqalv5o; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.featurecvterm
    ADD CONSTRAINT fk_iy7bbt67s7jaemiajsrqalv5o FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: fk_j4dnb11fi9vcvrdjo5m352pyq; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_property_publication
    ADD CONSTRAINT fk_j4dnb11fi9vcvrdjo5m352pyq FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_jaqi1bk3t2c0m3pybmparp856; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm_path
    ADD CONSTRAINT fk_jaqi1bk3t2c0m3pybmparp856 FOREIGN KEY (type_id) REFERENCES public.cvterm(id);


--
-- Name: fk_jbw15sttun6yrcrxchi0lwtam; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_property_organismdbxref
    ADD CONSTRAINT fk_jbw15sttun6yrcrxchi0lwtam FOREIGN KEY (organismdbxref_id) REFERENCES public.organismdbxref(id);


--
-- Name: fk_jcoeehgesgr9lc34aqsc0iubc; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.available_status_feature_type
    ADD CONSTRAINT fk_jcoeehgesgr9lc34aqsc0iubc FOREIGN KEY (available_status_feature_types_id) REFERENCES public.available_status(id);


--
-- Name: fk_jh0fc3orduigl8s7ymentbtrs; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype
    ADD CONSTRAINT fk_jh0fc3orduigl8s7ymentbtrs FOREIGN KEY (cvalue_id) REFERENCES public.cvterm(id);


--
-- Name: fk_jppito7humh6e3v5mjjtutd7h; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.user_group_users
    ADD CONSTRAINT fk_jppito7humh6e3v5mjjtutd7h FOREIGN KEY (user_id) REFERENCES public.grails_user(id);


--
-- Name: fk_jpvdxc57abfiridcr57x8130; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_property
    ADD CONSTRAINT fk_jpvdxc57abfiridcr57x8130 FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: fk_jquf8fftudekrwgx1e870jy43; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_location_publication
    ADD CONSTRAINT fk_jquf8fftudekrwgx1e870jy43 FOREIGN KEY (feature_location_feature_location_publications_id) REFERENCES public.feature_location(id);


--
-- Name: fk_jsuq1rc9mb07tg4kubnqn8yw6; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.grails_user_roles
    ADD CONSTRAINT fk_jsuq1rc9mb07tg4kubnqn8yw6 FOREIGN KEY (user_id) REFERENCES public.grails_user(id);


--
-- Name: fk_k5tey4kvd1siry9ga6008n751; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.go_annotation
    ADD CONSTRAINT fk_k5tey4kvd1siry9ga6008n751 FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: fk_k84f8qd6a80roie9yid9oa0gh; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_filter
    ADD CONSTRAINT fk_k84f8qd6a80roie9yid9oa0gh FOREIGN KEY (canned_value_id) REFERENCES public.canned_value(id);


--
-- Name: fk_kaayriabr4k4b3aomk46dmc77; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_property_organismdbxref
    ADD CONSTRAINT fk_kaayriabr4k4b3aomk46dmc77 FOREIGN KEY (organism_property_organismdbxrefs_id) REFERENCES public.organism_property(id);


--
-- Name: fk_ke2nrw91sxil8mv7osgv83pw1; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm_path
    ADD CONSTRAINT fk_ke2nrw91sxil8mv7osgv83pw1 FOREIGN KEY (cv_id) REFERENCES public.cv(id);


--
-- Name: fk_kfq8esgv3in8wxml2x36f2md; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT fk_kfq8esgv3in8wxml2x36f2md FOREIGN KEY (status_id) REFERENCES public.feature_property(id);


--
-- Name: fk_l1jfi0wpnyooutd820p5gskr; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organismdbxref
    ADD CONSTRAINT fk_l1jfi0wpnyooutd820p5gskr FOREIGN KEY (organism_id) REFERENCES public.organism(id);


--
-- Name: fk_l94xl424xp988f06gr2b3t5tw; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.analysis_feature
    ADD CONSTRAINT fk_l94xl424xp988f06gr2b3t5tw FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: fk_lflwbgxduee8ljjwe5rfbdil2; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_grails_user
    ADD CONSTRAINT fk_lflwbgxduee8ljjwe5rfbdil2 FOREIGN KEY (user_id) REFERENCES public.grails_user(id);


--
-- Name: fk_ll4cqdh994s6x8n7vku1q7iwd; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_synonym
    ADD CONSTRAINT fk_ll4cqdh994s6x8n7vku1q7iwd FOREIGN KEY (synonym_id) REFERENCES public.synonym(id);


--
-- Name: fk_n4lr2f61atuxmm8cb90qtkojq; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_location_publication
    ADD CONSTRAINT fk_n4lr2f61atuxmm8cb90qtkojq FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_n6n7lheb1qkmlde8u6gvvjxne; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_dbxref
    ADD CONSTRAINT fk_n6n7lheb1qkmlde8u6gvvjxne FOREIGN KEY (dbxref_id) REFERENCES public.dbxref(id);


--
-- Name: fk_nf9qbuay984ixqd2k1425rnyo; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_synonym
    ADD CONSTRAINT fk_nf9qbuay984ixqd2k1425rnyo FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: fk_np3tfcu9g867to3qux6raf9y8; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.dbxref
    ADD CONSTRAINT fk_np3tfcu9g867to3qux6raf9y8 FOREIGN KEY (db_id) REFERENCES public.db(id);


--
-- Name: fk_nq02ir0qeydr5tj3071k9gl7b; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm_path
    ADD CONSTRAINT fk_nq02ir0qeydr5tj3071k9gl7b FOREIGN KEY (subjectcvterm_id) REFERENCES public.cvterm(id);


--
-- Name: fk_ob1d0vrfaix8b28j4tvilqnyv; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm_relationship
    ADD CONSTRAINT fk_ob1d0vrfaix8b28j4tvilqnyv FOREIGN KEY (type_id) REFERENCES public.cvterm(id);


--
-- Name: fk_oh81hma8qx88fhvcmfugx836b; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publicationdbxref
    ADD CONSTRAINT fk_oh81hma8qx88fhvcmfugx836b FOREIGN KEY (dbxref_id) REFERENCES public.dbxref(id);


--
-- Name: fk_oksfqluv12ktmut9s6o9jla7a; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm
    ADD CONSTRAINT fk_oksfqluv12ktmut9s6o9jla7a FOREIGN KEY (cv_id) REFERENCES public.cv(id);


--
-- Name: fk_ouqjfw5stpwvacl0o8rdn6i6c; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.allele_info
    ADD CONSTRAINT fk_ouqjfw5stpwvacl0o8rdn6i6c FOREIGN KEY (allele_id) REFERENCES public.allele(id);


--
-- Name: fk_p2dpr2q41es50wbr29lsuhrqi; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.user_group_admin
    ADD CONSTRAINT fk_p2dpr2q41es50wbr29lsuhrqi FOREIGN KEY (user_id) REFERENCES public.grails_user(id);


--
-- Name: fk_p4j8je0rybguxq29hc2e3hosa; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.canned_key_feature_type
    ADD CONSTRAINT fk_p4j8je0rybguxq29hc2e3hosa FOREIGN KEY (canned_key_feature_types_id) REFERENCES public.canned_key(id);


--
-- Name: fk_pgoyqd75q47r6ycwowcppbhk6; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publicationdbxref
    ADD CONSTRAINT fk_pgoyqd75q47r6ycwowcppbhk6 FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_phmfgylejydjqyrvo3imc97go; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype
    ADD CONSTRAINT fk_phmfgylejydjqyrvo3imc97go FOREIGN KEY (attribute_id) REFERENCES public.cvterm(id);


--
-- Name: fk_pniehpb3pk1rqe95ejk0od6vg; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.featurecvterm_dbxref
    ADD CONSTRAINT fk_pniehpb3pk1rqe95ejk0od6vg FOREIGN KEY (featurecvterm_featurecvtermdbxrefs_id) REFERENCES public.featurecvterm(id);


--
-- Name: fk_pwxrfyx6rqu5krq4nj5wa3u4f; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm_relationship
    ADD CONSTRAINT fk_pwxrfyx6rqu5krq4nj5wa3u4f FOREIGN KEY (subjectcvterm_id) REFERENCES public.cvterm(id);


--
-- Name: fk_q3wop7ii25dgiofnp2l3yj9v0; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.featurecvterm
    ADD CONSTRAINT fk_q3wop7ii25dgiofnp2l3yj9v0 FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: fk_q6hf14oiq9pomkjrhtndonmeh; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.publication_relationship
    ADD CONSTRAINT fk_q6hf14oiq9pomkjrhtndonmeh FOREIGN KEY (type_id) REFERENCES public.cvterm(id);


--
-- Name: fk_q6jvhi3l7ty0m9tpbn09d8pxj; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_statement
    ADD CONSTRAINT fk_q6jvhi3l7ty0m9tpbn09d8pxj FOREIGN KEY (environment_id) REFERENCES public.environment(id);


--
-- Name: fk_qml7xp9f5uojcw7jwdxcb35le; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_location
    ADD CONSTRAINT fk_qml7xp9f5uojcw7jwdxcb35le FOREIGN KEY (feature_id) REFERENCES public.feature(id);


--
-- Name: fk_qolh5l4blkx8vfmwcl7f3woan; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_publication
    ADD CONSTRAINT fk_qolh5l4blkx8vfmwcl7f3woan FOREIGN KEY (feature_feature_publications_id) REFERENCES public.feature(id);


--
-- Name: fk_qwab1rve68gwjrhmfcs3wkn47; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.suggested_name_feature_type
    ADD CONSTRAINT fk_qwab1rve68gwjrhmfcs3wkn47 FOREIGN KEY (suggested_name_feature_types_id) REFERENCES public.suggested_name(id);


--
-- Name: fk_qyxdgqthtlgixvtdkkhc8g3pu; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_organism_property
    ADD CONSTRAINT fk_qyxdgqthtlgixvtdkkhc8g3pu FOREIGN KEY (organism_organism_properties_id) REFERENCES public.organism(id);


--
-- Name: fk_r1o1rnfnsf7oipuv1h7h1fln7; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm_relationship
    ADD CONSTRAINT fk_r1o1rnfnsf7oipuv1h7h1fln7 FOREIGN KEY (objectcvterm_id) REFERENCES public.cvterm(id);


--
-- Name: fk_r9xhefcekikp1od79ectkb22b; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.featurecvterm_dbxref
    ADD CONSTRAINT fk_r9xhefcekikp1od79ectkb22b FOREIGN KEY (dbxref_id) REFERENCES public.dbxref(id);


--
-- Name: fk_rkx6r039wusc3cl254ljnmkkn; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.user_group_admin
    ADD CONSTRAINT fk_rkx6r039wusc3cl254ljnmkkn FOREIGN KEY (user_group_id) REFERENCES public.user_group(id);


--
-- Name: fk_ro87rogww8hoobbwya2nn16xk; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.preference
    ADD CONSTRAINT fk_ro87rogww8hoobbwya2nn16xk FOREIGN KEY (user_id) REFERENCES public.grails_user(id);


--
-- Name: fk_rrwb96jjqgtg077yv8pbim3jj; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.environmentcvterm
    ADD CONSTRAINT fk_rrwb96jjqgtg077yv8pbim3jj FOREIGN KEY (environment_id) REFERENCES public.environment(id);


--
-- Name: fk_rux0954nxr4lwvj2qgyjibua7; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT fk_rux0954nxr4lwvj2qgyjibua7 FOREIGN KEY (organism_id) REFERENCES public.organism(id);


--
-- Name: fk_s3vk7onqrk0n4c86xnvqmm3ho; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organismdbxref
    ADD CONSTRAINT fk_s3vk7onqrk0n4c86xnvqmm3ho FOREIGN KEY (dbxref_id) REFERENCES public.dbxref(id);


--
-- Name: fk_s6sh7k841fpxc4dk2ok24naa5; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.go_annotation_grails_user
    ADD CONSTRAINT fk_s6sh7k841fpxc4dk2ok24naa5 FOREIGN KEY (user_id) REFERENCES public.grails_user(id);


--
-- Name: fk_scm5rx2kuhgkhdfvskyo924cy; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature_relationship_feature_property
    ADD CONSTRAINT fk_scm5rx2kuhgkhdfvskyo924cy FOREIGN KEY (feature_property_id) REFERENCES public.feature_property(id);


--
-- Name: fk_sd72dgaipyx0koibgt7wobga5; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_filter
    ADD CONSTRAINT fk_sd72dgaipyx0koibgt7wobga5 FOREIGN KEY (organism_id) REFERENCES public.organism(id);


--
-- Name: fk_ssx0gv6xbtu3tbwt6ekkmn4iw; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.allele
    ADD CONSTRAINT fk_ssx0gv6xbtu3tbwt6ekkmn4iw FOREIGN KEY (variant_id) REFERENCES public.feature(id);


--
-- Name: fk_t52r166gd8710vffy3aompe7d; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_description
    ADD CONSTRAINT fk_t52r166gd8710vffy3aompe7d FOREIGN KEY (environment_id) REFERENCES public.environment(id);


--
-- Name: fk_t6ojbvugx8kou45oklsie3rt5; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.dbxref_property
    ADD CONSTRAINT fk_t6ojbvugx8kou45oklsie3rt5 FOREIGN KEY (type_id) REFERENCES public.cvterm(id);


--
-- Name: fk_tjfmsb0nhnpda6dptagpcpbkp; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.organism_filter
    ADD CONSTRAINT fk_tjfmsb0nhnpda6dptagpcpbkp FOREIGN KEY (canned_key_id) REFERENCES public.canned_key(id);


--
-- Name: fk_tk1pgifvuhurefn0y3myfyyt4; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.phenotype_statement
    ADD CONSTRAINT fk_tk1pgifvuhurefn0y3myfyyt4 FOREIGN KEY (type_id) REFERENCES public.cvterm(id);


--
-- Name: fk_tlfh10092i00g6rlv589naqy5; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.cvterm_path
    ADD CONSTRAINT fk_tlfh10092i00g6rlv589naqy5 FOREIGN KEY (objectcvterm_id) REFERENCES public.cvterm(id);


--
-- Name: fk_toot78feskjigpn5d5i5v7o5s; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.feature
    ADD CONSTRAINT fk_toot78feskjigpn5d5i5v7o5s FOREIGN KEY (reference_allele_id) REFERENCES public.allele(id);


--
-- Name: fk_tql9djnqw1d7migfndoj3lrph; Type: FK CONSTRAINT; Schema: public; Owner: apollo2_user
--

ALTER TABLE ONLY public.environmentcvterm
    ADD CONSTRAINT fk_tql9djnqw1d7migfndoj3lrph FOREIGN KEY (cvterm_id) REFERENCES public.cvterm(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

