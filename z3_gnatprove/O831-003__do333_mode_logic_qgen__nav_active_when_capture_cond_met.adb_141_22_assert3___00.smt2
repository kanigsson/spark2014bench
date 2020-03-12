(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-const pilot_flying_side Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const selected_nav_source_changed Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const selected_nav_frequency_changed Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const nav_capture_cond_met Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const no_higher_event_than_nav_capture_cond_met Bool)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const nav_active Bool)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const modes_on Bool)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__mode_logic_props_types__changed_state__unit_delay_memory Bool)(rec__mode_logic_props_types__changed_state__in1_out1 Bool)))))
(define-fun us_split_fields_rec__mode_logic_props_types__changed_state__unit_delay_memory__projection ((a us_split_fields)) Bool 
  (rec__mode_logic_props_types__changed_state__unit_delay_memory a))

(define-fun us_split_fields_rec__mode_logic_props_types__changed_state__in1_out1__projection ((a us_split_fields)) Bool 
  (rec__mode_logic_props_types__changed_state__in1_out1 a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__mode_logic_props_types__changed_state__unit_delay_memory
                                (us_split_fields1 a)) 1 0) (ite (rec__mode_logic_props_types__changed_state__unit_delay_memory
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (ite (rec__mode_logic_props_types__changed_state__in1_out1
                                (us_split_fields1 a)) 1 0) (ite (rec__mode_logic_props_types__changed_state__in1_out1
                                                                (us_split_fields1
                                                                b)) 1 0)))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const mode_logic_props_types__changed_state__unit_delay_memory__first__bit Int)

(declare-const mode_logic_props_types__changed_state__unit_delay_memory__last__bit Int)

(declare-const mode_logic_props_types__changed_state__unit_delay_memory__position Int)

;; mode_logic_props_types__changed_state__unit_delay_memory__first__bit_axiom
  (assert
  (<= 0 mode_logic_props_types__changed_state__unit_delay_memory__first__bit))

;; mode_logic_props_types__changed_state__unit_delay_memory__last__bit_axiom
  (assert
  (< mode_logic_props_types__changed_state__unit_delay_memory__first__bit 
  mode_logic_props_types__changed_state__unit_delay_memory__last__bit))

;; mode_logic_props_types__changed_state__unit_delay_memory__position_axiom
  (assert
  (<= 0 mode_logic_props_types__changed_state__unit_delay_memory__position))

(declare-const mode_logic_props_types__changed_state__in1_out1__first__bit Int)

(declare-const mode_logic_props_types__changed_state__in1_out1__last__bit Int)

(declare-const mode_logic_props_types__changed_state__in1_out1__position Int)

;; mode_logic_props_types__changed_state__in1_out1__first__bit_axiom
  (assert (<= 0 mode_logic_props_types__changed_state__in1_out1__first__bit))

;; mode_logic_props_types__changed_state__in1_out1__last__bit_axiom
  (assert
  (< mode_logic_props_types__changed_state__in1_out1__first__bit mode_logic_props_types__changed_state__in1_out1__last__bit))

;; mode_logic_props_types__changed_state__in1_out1__position_axiom
  (assert (<= 0 mode_logic_props_types__changed_state__in1_out1__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ()
((changed_state__ref
 (changed_state__refqtmk (changed_state__content us_rep)))))
(define-fun changed_state__ref_changed_state__content__projection ((a changed_state__ref)) us_rep 
  (changed_state__content a))

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

(declare-const attr__ATTRIBUTE_ADDRESS16 Int)

(declare-const attr__ATTRIBUTE_ADDRESS17 Int)

(declare-const attr__ATTRIBUTE_ADDRESS18 Int)

(declare-const attr__ATTRIBUTE_ADDRESS19 Int)

(declare-const attr__ATTRIBUTE_ADDRESS20 Int)

(declare-const attr__ATTRIBUTE_ADDRESS21 Int)

(declare-const attr__ATTRIBUTE_ADDRESS22 Int)

(declare-const attr__ATTRIBUTE_ADDRESS23 Int)

(declare-const attr__ATTRIBUTE_ADDRESS24 Int)

(declare-const attr__ATTRIBUTE_ADDRESS25 Int)

(declare-const attr__ATTRIBUTE_ADDRESS26 Int)

(declare-const unit_delay_memory Bool)

(declare-const unit_delay1_memory Bool)

(declare-const changed_memory__split_fields us_split_fields)

;; Assume
  (assert true)

(declare-const unit_delay_out1 Bool)

;; H
  (assert (= unit_delay_out1 unit_delay_memory))

(declare-const unit_delay1_out1 Bool)

;; H
  (assert (= unit_delay1_out1 unit_delay1_memory))

(declare-const modes_on_out1 Bool)

;; H
  (assert (= modes_on_out1 modes_on))

(declare-const nav_active_out1 Bool)

;; H
  (assert (= nav_active_out1 nav_active))

(declare-const nav_capture_cond_met_out1 Bool)

;; H
  (assert (= nav_capture_cond_met_out1 nav_capture_cond_met))

(declare-const no_higher_event_than_nav_capture_cond_met_out1 Bool)

;; H
  (assert
  (= no_higher_event_than_nav_capture_cond_met_out1 no_higher_event_than_nav_capture_cond_met))

(declare-const pilot_flying_side_out1 Bool)

;; H
  (assert (= pilot_flying_side_out1 pilot_flying_side))

(declare-const changed_memory__split_fields1 us_split_fields)

(declare-const changed_out1 Bool)

;; Ensures
  (assert true)

(declare-const selected_nav_frequency_changed_out1 Bool)

;; H
  (assert
  (= selected_nav_frequency_changed_out1 selected_nav_frequency_changed))

(declare-const selected_nav_source_changed_out1 Bool)

;; H
  (assert (= selected_nav_source_changed_out1 selected_nav_source_changed))

(declare-const not4_out1 Bool)

;; H
  (assert (= not4_out1 (ite (= changed_out1 true) false true)))

(declare-const not3_out1 Bool)

;; H
  (assert
  (= not3_out1 (ite (= selected_nav_frequency_changed_out1 true) false true)))

(declare-const not2_out1 Bool)

;; H
  (assert
  (= not2_out1 (ite (= selected_nav_source_changed_out1 true) false true)))

(declare-const not_out1 Bool)

;; H
  (assert (= not_out1 (ite (= unit_delay1_out1 true) false true)))

(declare-const or_out1 Bool)

;; H
  (assert
  (= or_out1 (ite (= (ite (= (ite (= (ite (= (ite (= (ite (= (ite (= 
                                                             unit_delay_out1 true)
                                                             not_out1 false) true)
                                                     nav_capture_cond_met_out1
                                                     false) true)
                                             not2_out1 false) true)
                                     not3_out1 false) true)
                             not4_out1 false) true)
                     modes_on_out1 false) true)
             no_higher_event_than_nav_capture_cond_met_out1 false)))

(declare-const not1_out1 Bool)

;; H
  (assert (= not1_out1 (ite (= or_out1 true) false true)))

(declare-const not5_out1 Bool)

;; H
  (assert (= not5_out1 (ite (= not1_out1 true) true nav_active_out1)))

(assert
;; defqtvc
 ;; File "nav_active_when_capture_cond_met.ads", line 19, characters 0-0
  (not (= not5_out1 true)))
(check-sat)
