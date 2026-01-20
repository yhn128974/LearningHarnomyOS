import { formBindingData, FormExtensionAbility, formInfo, formProvider } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';
import { processSubscriber } from '../utils/SubscriberClass';

export default class EntryFormAbility extends FormExtensionAbility {
  onAddForm(want: Want) {
    // Called to return a FormBindingData object.
    let formData: string = '';
    //添加卡片时监听消息
    let formId: string = want.parameters![formInfo.FormParam.IDENTITY_KEY] as string

    processSubscriber.subscribe('cardUpdate', (res) => {
      switch (res) {
        case 'time':
          //formProvider.updateForm的数据会直接发送到localStorage中
          formProvider.updateForm(formId, formBindingData.createFormBindingData({
            time: Date.now()
          }))
      }
    })

    return formBindingData.createFormBindingData(formData);
  }

  onCastToNormalForm(formId: string) {
    // Called when the form provider is notified that a temporary form is successfully
    // converted to a normal form.
  }

  onUpdateForm(formId: string) {
    // Called to notify the form provider to update a specified form.
  }

  onFormEvent(formId: string, message: string) {
    // Called when a specified message event defined by the form provider is triggered.

    processSubscriber.publish('appUpdate', Date.now().toString())
  }

  onRemoveForm(formId: string) {
    // Called to notify the form provider that a specified form has been destroyed.
  }

  onAcquireFormState(want: Want) {
    // Called to return a {@link FormState} object.
    return formInfo.FormState.READY;
  }
}