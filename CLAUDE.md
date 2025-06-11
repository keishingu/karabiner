# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

これはKarabiner-Elementsの設定リポジトリです。Karabiner-ElementsはmacOS用のキーボードカスタマイズツールで、キーの再マッピングや複雑なキー組み合わせの作成が可能です。

## 主要ファイル

- `karabiner.json`: プロファイル、デバイス設定、キーマッピングを含むメイン設定ファイル
- `automatic_backups/`: Karabiner-Elementsが自動作成する設定ファイルのバックアップ

## 設定構造

`karabiner.json`は以下の構造に従います：
- `profiles[]`: 設定プロファイルの配列
- `simple_modifications[]`: 基本的なキー再マッピングルール（全キーボード適用）
- `complex_modifications`: 複雑なキー組み合わせやルール
- `virtual_hid_keyboard`: 国コードやキーボードタイプを含む仮想キーボード設定

## 現在の設定

アクティブな設定はJISキーボードレイアウトを使用し、以下のキーマッピングを含みます：

### Simple Modifications（基本キー変更）
- 右⌘キー → F7（カタカナ変換）
- 右Shiftキー → F6（ひらがな変換）

### Complex Modifications（複合キー操作）
- Ctrl+hjkl → 矢印キー（Vim風ナビゲーション）
- Ctrl+Space → Enter
- Ctrl+B → Backspace
- Ctrl+X → Ctrl+K（行末まで削除）
- Ctrl+I → F2（Excel編集モード）
- Ctrl+S → Shift+⌘+Ctrl+4（スクリーンショット→クリップボード）

## 設定の編集について

`karabiner.json`を変更する際は：
1. Karabiner-Elementsが自動的に`automatic_backups/`にバックアップを作成
2. ファイル保存時に変更が即座に反映
3. Karabinerドキュメントの正しいキーコードを使用し、適切なJSON形式を保持
4. 設定全体を壊さないよう段階的にテスト