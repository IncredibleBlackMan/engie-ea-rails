## ENGIE EA

## Description

This application aims to offer partners with the ability to customise custom attributes to their models in an easy way.

## Setup

1. Clone this repository `git clone https://github.com/IncredibleBlackMan/engie-ea-rails.git`
2. Run `bundle install` to install all required gems

## Approach
1. Added `Battery` and `Customer` models
2. Create `CustomDataSchema` model to hold the schema definition for the custom attributes being added.
3. Create `CustomAttribute` model with a polymorphic relationship that would hold the custom data from any model.
4. Add a `ModelAttributeExtension` module that defines getter and setter methods from the custom_data_schema. These methods would make it possible to do something like `email = Customer.first.email`, with email being an custom attribute.
