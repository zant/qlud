// @ts-nocheck
import { Arg, Mutation, Query, Resolver } from 'type-graphql'
import { __entity__ } from './__entity__'
import { __entity__Input } from './inputs'

@Resolver(() => __entity__)
export class __entity__Resolver {
  @Mutation(() => SuperToken)
  async addSuperToken(@Arg('__entityCamel__') __entityCamel__Input: __entity__Input) {
    const superToken = SuperToken.create({
      ...__entityCamel__Input,
    })

    
    return await __entity__.save(__entityCamel__)
  }
  @Query(() => [__entity__])
  all__entity__(): Promise<__entity__[]> {
    return __entity__.find()
  }
}
