GraphQL::Introspection::TypeType = GraphQL::ObjectType.define do
  name "__Type"
  description "The fundamental unit of any GraphQL Schema is the type. There are many kinds of types in "\
              "GraphQL as represented by the `__TypeKind` enum.\n\n"\
              "Depending on the kind of a type, certain fields describe information about that type. "\
              "Scalar types provide no information beyond a name and description, while "\
              "Enum types provide their values. Object and Interface types provide the fields "\
              "they describe. Abstract types, Union and Interface, provide the Object types "\
              "possible at runtime. List and NonNull types compose other types."

  field :name, types.String
  field :description, types.String
  field :kind do
    type !GraphQL::Introspection::TypeKindEnum
    resolve -> (target, a, c) { target.kind.name }
  end
  field :fields,        GraphQL::Introspection::FieldsField
  field :ofType,        GraphQL::Introspection::OfTypeField
  field :inputFields,   GraphQL::Introspection::InputFieldsField
  field :possibleTypes, GraphQL::Introspection::PossibleTypesField
  field :enumValues,    GraphQL::Introspection::EnumValuesField
  field :interfaces,    GraphQL::Introspection::InterfacesField
end
