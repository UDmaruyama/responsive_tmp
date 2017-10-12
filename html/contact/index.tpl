<? if(isfrm()){ ?>
<div class="chui">
<? if(isipt()){ ?>
<ul>
<li>記入もれの無いようお願いします。必須項目は必ず御入力下さい。</li>
<li>全ての内容を入力されましたら「入力内容の確認」ボタンを押してください。</li>
<li>登録されたメールアドレスに、こちらからメールさせて頂くことがありますのでご了承ください。</li>
<li>１週間たっても連絡がない場合は、正しく送信されていない場合がありますので、<br />お手数ですが再度送信していただくか、当社に直接ご連絡ください。</li>
</ul>
<? } else { ?>
<ul>
<li>以下の内容でよろしいでしょうか。</li>
<li>よろしければ「メールの送信」ボタンを押してください。</li>
</ul>
<? } ?>
</div>
<form action="" method="post" id="contact">
<table class="frm_tbl">
<tbody>

<tr>
  <th width="100" rowspan="2">お名前<span class="h">必須</span></th>
  <th class="d">漢字</th>
  <td>
    <? if(fmipt('name')){ ?>
    <label for='name' generated='true' class='error'></label>
    <input type="text" size="35" style="ime-mode: active;" class="help" title="(例)静岡太郎" onFocus="cText(this)" onBlur="sText(this)" <?=inputvalue('name');?>/><span>（全角文字）</span>
    <? } ?>
  </td>
</tr>
<tr>
  <th class="d">フリガナ</th>
  <td>
    <? if(fmipt('kana')){ ?>
    <label for='kana' generated='true' class='error'></label>
    <input type="text" size="35" style="ime-mode: active;" class="help" title="(例)シズオカタロウ" onFocus="cText(this)" onBlur="sText(this)" <?=inputvalue('kana');?>/><span>（全角カナ）</span>
    <? } ?>
  </td>
</tr>

<tr>
  <th rowspan="2">住所<span class="h">必須</span></th>
  <th class="d">郵便番号</th>
  <td>
    <? if(fmipt('zip')){ ?>
    <label for='zip' generated='true' class='error'></label><div style="color:#b00" id="res"></div>
    <input type="text" maxlength="8" size="15" style="ime-mode: disabled;" id="zip" title="(例)422-8063" onFocus="cText(this)" onBlur="sText(this)" <?=inputvalue('zip');?>/><span>（半角数字/ハイフンあり）</span>
    <input type="button" value="住所検索" onclick="zipsearch('zip','pref','address','address','res');" class="no_search"/>
    <? } ?>
  </td>
</tr>

<tr>
  <th class="d">都道府県/市区町村番地</th>
  <td>
    <? if(fmipt('address',' ')){ ?>
    <dl>
    <dt></dt>
    <dd>
      <label for='pref' generated='true' class='error'></label>
      <select name="address[0]" id="pref">
      <option value="">▼選択</option>
      <? foreach($PREFS as $n){ ?>
      <option value="<?=$n;?>" <?=wselected('address',$n,0);?>><?=$n;?></option>
      <? } ?>
      </select>
    </dd>
    <dt></dt>
    <dd>
      <label for='address' generated='true' class='error'></label>
      <input type="text" size="35" style="ime-mode:active;" id="address" title="(例)静岡県静岡市駿河区中田2丁目4-40" onFocus="cText(this)" onBlur="sText(this)" <?=inputvalue('address',1);?>/>
    </dd>
    </dl><? } ?>
  </td>
</tr>

<tr>
  <th colspan="2">連絡先電話番号<br />(携帯電話など)<span class="h">必須</span></th>
  <td>
    <? if(fmipt('tel')){ ?>
    <label for='tel' generated='true' class='error'></label>
    <input type="text" size="35" style="ime-mode: disabled;" class="help" title="(例)054-280-1670" onFocus="cText(this)" onBlur="sText(this)" <?=inputvalue('tel');?>/><span>（半角数字/ハイフンあり）</span>
    <? } ?>
  </td>
</tr>

<tr>
  <th colspan="2">メールアドレス</th>
  <td>
    <? if(fmipt('mail')){ ?>
    <label for='mail' generated='true' class='error'></label>
    <input type="text" size="35" style="ime-mode: disabled;" class="help" title="(例)info@adtechnica.co.jp" onFocus="cText(this)" onBlur="sText(this)" <?=inputvalue('mail');?>/><span>（半角英数）</span>
    <? } ?>
  </td>
</tr>

<tr>
  <th colspan="2">希望職種<span class="h">必須</span></th>
  <td>
    <? if(fmipt('hopejob')){ ?>
    <label for='hopejob' generated='true' class='error'></label>
    <input type="text" size="35" style="ime-mode: active;" class="help" title="(例)希望職種の入力例を入れる" onFocus="cText(this)" onBlur="sText(this)" <?=inputvalue('hopejob');?>/><span>（半角英数）</span>
    <? } ?>
  </td>
</tr>

<tr>
  <th colspan="2">お問い合わせ内容</th>
  <td>
    <? if(fmipt('comment')){ ?>
    <label for='comment' generated='true' class='error'></label>
    <textarea cols="50" rows="10" style="ime-mode:active;" class="help" name="comment" value=""><?=wfm('comment');?></textarea>
    <? } ?>
  </td>
</tr>

</tbody></table>
<div class="form_btn">
<? if(isipt()){ ?>
<button class="confirm" name="submit1">入力内容の確認</button>
<? } else { ?>
<button class="back" name="submit3">前のページへ戻る</button>
<button class="send" name="submit2">メールの送信</button>
<? } ?>
</div>
</form>
<div class="privacy">
<h3>個人情報保護について</h3>
<h4>個人情報の取得・利用目的について</h4>
お客様から個人情報をご提供いただく際は予め利用目的を明示した上で、必要な範囲の個人情報を取得させていただきます。ご提供いただいた個人情報は、当社の取り扱う商品やお客様へのサービス・情報の提供にのみ利用させて頂きます。それ以外に、個人情報を利用する必要が生じた場合は、お客様にその旨を確認し、同意を得た上で利用いたします。<br /><br />
<h4>個人情報の第三者への提供について</h4>
お客様より取得させていただいた個人情報は、法令の定めによる場合、お客様ご本人及び、公衆の生命、健康、財産等の重大な利益を保護するために必要な場合、予めお客様ご本人から同意を得ている場合を除き、第三者への提供は致しません。<br /><br />
<h4>個人情報に対する開示等について</h4>
お客様より取得させていただいた個人情報について、お客様本人より情報の開示、訂正、削除等のお申し出があった場合は、ご本人であることを確認の上で対応させていただきます。お申し出、お問合せは当社までご連絡ください。<br /><br />
<h4>個人情報の管理について</h4>
お客様より取得させていただいた個人情報は、不正アクセスや紛失、破壊、改ざん、漏洩に対する予防ならびに是正に努め、合理的な安全対策を講じます。また、個人情報保護に関する法令及びその他の規範を遵守致します。<br /><br />
<h4>個人情報に関するお問合せ</h4>
当社の個人情報の取扱いに関するご相談、ご要望等については、当社までご連絡ください。
</div>
<? } ?>
