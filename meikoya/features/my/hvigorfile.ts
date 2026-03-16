import { hspTasks } from '@ohos/hvigor-ohos-plugin';
import { hspPlugin } from "@hadss/hmrouter-plugin";

export default {
  system: hspTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  plugins: [hspPlugin()]         /* Custom plugin to extend the functionality of Hvigor. */
}
