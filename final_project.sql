-- Membuat database baru
CREATE DATABASE final_project;

-- Dimension Country
CREATE TABLE dim_country (
    countryiso3 VARCHAR(10) PRIMARY KEY,
    country VARCHAR(100),
    gdp FLOAT
);

-- Dimension Market
CREATE TABLE dim_market (
    market_id VARCHAR(50) PRIMARY KEY,
    market VARCHAR(255),
    admin_1 VARCHAR(255),
    admin_2 VARCHAR(255),
    countryiso3 VARCHAR(50) REFERENCES dim_country(countryiso3),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION
);

-- Dimension Commodity
CREATE TABLE dim_commodity (
    commodity_id VARCHAR(50) PRIMARY KEY,
    commodity VARCHAR(255),
    category VARCHAR(100),
    unit VARCHAR(50)
);

-- Dimension Date
CREATE TABLE dim_date (
    date DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT
);

-- Fact Food Price
CREATE TABLE fact_food_price (
    food_price_id VARCHAR(50) PRIMARY KEY,
    date DATE,
    market_id VARCHAR(50),
    countryiso3 VARCHAR(50),
    commodity_id VARCHAR(50),
    priceflag VARCHAR(50),
    price DOUBLE PRECISION,
    usdprice DOUBLE PRECISION,
    pricetype VARCHAR(50),
    currency VARCHAR(20)
    
    -- Definisi Relasi (Foreign Keys)
    CONSTRAINT fk_date FOREIGN KEY (date) 
        REFERENCES dim_date (date),
    CONSTRAINT fk_market FOREIGN KEY (market_id) 
        REFERENCES dim_market (market_id),
    CONSTRAINT fk_commodity FOREIGN KEY (commodity_id) 
        REFERENCES dim_commodity (commodity_id)
);

SELECT * FROM fact_food_price;


