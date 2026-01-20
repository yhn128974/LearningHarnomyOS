import { Context } from "@kit.AbilityKit";

export class currentUIAbilityContext {
  context: Context

  constructor(context: Context) {
    this.context = context
  }
}