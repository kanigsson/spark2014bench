(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((time__ref 0))
(((time__refqtmk (time__content us_rep)))))
(define-fun time__ref_time__content__projection ((a time__ref)) us_rep 
  (time__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__traffic_lights__traffic_lightT__last_state_change us_rep)(rec__traffic_lights__traffic_lightT__vehicles_green Bool)(rec__traffic_lights__traffic_lightT__vehicles_yellow Bool)(rec__traffic_lights__traffic_lightT__vehicles_red Bool)(rec__traffic_lights__traffic_lightT__pedestrians_green Bool)(rec__traffic_lights__traffic_lightT__pedestrians_red Bool)(rec__traffic_lights__traffic_lightT__change_state Bool)))))
(define-fun us_split_fields_rec__traffic_lights__traffic_lightT__last_state_change__projection ((a us_split_fields)) us_rep 
  (rec__traffic_lights__traffic_lightT__last_state_change a))

(define-fun us_split_fields_rec__traffic_lights__traffic_lightT__vehicles_green__projection ((a us_split_fields)) Bool 
  (rec__traffic_lights__traffic_lightT__vehicles_green a))

(define-fun us_split_fields_rec__traffic_lights__traffic_lightT__vehicles_yellow__projection ((a us_split_fields)) Bool 
  (rec__traffic_lights__traffic_lightT__vehicles_yellow a))

(define-fun us_split_fields_rec__traffic_lights__traffic_lightT__vehicles_red__projection ((a us_split_fields)) Bool 
  (rec__traffic_lights__traffic_lightT__vehicles_red a))

(define-fun us_split_fields_rec__traffic_lights__traffic_lightT__pedestrians_green__projection ((a us_split_fields)) Bool 
  (rec__traffic_lights__traffic_lightT__pedestrians_green a))

(define-fun us_split_fields_rec__traffic_lights__traffic_lightT__pedestrians_red__projection ((a us_split_fields)) Bool 
  (rec__traffic_lights__traffic_lightT__pedestrians_red a))

(define-fun us_split_fields_rec__traffic_lights__traffic_lightT__change_state__projection ((a us_split_fields)) Bool 
  (rec__traffic_lights__traffic_lightT__change_state a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const traffic_lights__traffic_lightT__last_state_change__first__bit Int)

(declare-const traffic_lights__traffic_lightT__last_state_change__last__bit Int)

(declare-const traffic_lights__traffic_lightT__last_state_change__position Int)

;; traffic_lights__traffic_lightT__last_state_change__first__bit_axiom
  (assert
  (<= 0 traffic_lights__traffic_lightT__last_state_change__first__bit))

;; traffic_lights__traffic_lightT__last_state_change__last__bit_axiom
  (assert
  (< traffic_lights__traffic_lightT__last_state_change__first__bit traffic_lights__traffic_lightT__last_state_change__last__bit))

;; traffic_lights__traffic_lightT__last_state_change__position_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__last_state_change__position))

(declare-const traffic_lights__traffic_lightT__vehicles_green__first__bit Int)

(declare-const traffic_lights__traffic_lightT__vehicles_green__last__bit Int)

(declare-const traffic_lights__traffic_lightT__vehicles_green__position Int)

;; traffic_lights__traffic_lightT__vehicles_green__first__bit_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__vehicles_green__first__bit))

;; traffic_lights__traffic_lightT__vehicles_green__last__bit_axiom
  (assert
  (< traffic_lights__traffic_lightT__vehicles_green__first__bit traffic_lights__traffic_lightT__vehicles_green__last__bit))

;; traffic_lights__traffic_lightT__vehicles_green__position_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__vehicles_green__position))

(declare-const traffic_lights__traffic_lightT__vehicles_yellow__first__bit Int)

(declare-const traffic_lights__traffic_lightT__vehicles_yellow__last__bit Int)

(declare-const traffic_lights__traffic_lightT__vehicles_yellow__position Int)

;; traffic_lights__traffic_lightT__vehicles_yellow__first__bit_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__vehicles_yellow__first__bit))

;; traffic_lights__traffic_lightT__vehicles_yellow__last__bit_axiom
  (assert
  (< traffic_lights__traffic_lightT__vehicles_yellow__first__bit traffic_lights__traffic_lightT__vehicles_yellow__last__bit))

;; traffic_lights__traffic_lightT__vehicles_yellow__position_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__vehicles_yellow__position))

(declare-const traffic_lights__traffic_lightT__vehicles_red__first__bit Int)

(declare-const traffic_lights__traffic_lightT__vehicles_red__last__bit Int)

(declare-const traffic_lights__traffic_lightT__vehicles_red__position Int)

;; traffic_lights__traffic_lightT__vehicles_red__first__bit_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__vehicles_red__first__bit))

;; traffic_lights__traffic_lightT__vehicles_red__last__bit_axiom
  (assert
  (< traffic_lights__traffic_lightT__vehicles_red__first__bit traffic_lights__traffic_lightT__vehicles_red__last__bit))

;; traffic_lights__traffic_lightT__vehicles_red__position_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__vehicles_red__position))

(declare-const traffic_lights__traffic_lightT__pedestrians_green__first__bit Int)

(declare-const traffic_lights__traffic_lightT__pedestrians_green__last__bit Int)

(declare-const traffic_lights__traffic_lightT__pedestrians_green__position Int)

;; traffic_lights__traffic_lightT__pedestrians_green__first__bit_axiom
  (assert
  (<= 0 traffic_lights__traffic_lightT__pedestrians_green__first__bit))

;; traffic_lights__traffic_lightT__pedestrians_green__last__bit_axiom
  (assert
  (< traffic_lights__traffic_lightT__pedestrians_green__first__bit traffic_lights__traffic_lightT__pedestrians_green__last__bit))

;; traffic_lights__traffic_lightT__pedestrians_green__position_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__pedestrians_green__position))

(declare-const traffic_lights__traffic_lightT__pedestrians_red__first__bit Int)

(declare-const traffic_lights__traffic_lightT__pedestrians_red__last__bit Int)

(declare-const traffic_lights__traffic_lightT__pedestrians_red__position Int)

;; traffic_lights__traffic_lightT__pedestrians_red__first__bit_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__pedestrians_red__first__bit))

;; traffic_lights__traffic_lightT__pedestrians_red__last__bit_axiom
  (assert
  (< traffic_lights__traffic_lightT__pedestrians_red__first__bit traffic_lights__traffic_lightT__pedestrians_red__last__bit))

;; traffic_lights__traffic_lightT__pedestrians_red__position_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__pedestrians_red__position))

(declare-const traffic_lights__traffic_lightT__change_state__first__bit Int)

(declare-const traffic_lights__traffic_lightT__change_state__last__bit Int)

(declare-const traffic_lights__traffic_lightT__change_state__position Int)

;; traffic_lights__traffic_lightT__change_state__first__bit_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__change_state__first__bit))

;; traffic_lights__traffic_lightT__change_state__last__bit_axiom
  (assert
  (< traffic_lights__traffic_lightT__change_state__first__bit traffic_lights__traffic_lightT__change_state__last__bit))

;; traffic_lights__traffic_lightT__change_state__position_axiom
  (assert (<= 0 traffic_lights__traffic_lightT__change_state__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-datatypes ((traffic_lightT__ref 0))
(((traffic_lightT__refqtmk (traffic_lightT__content us_rep1)))))
(define-fun traffic_lightT__ref_traffic_lightT__content__projection ((a traffic_lightT__ref)) us_rep1 
  (traffic_lightT__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const time_first us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_191 us_rep1)
  (temp___skip_top_level_192 Bool)) Bool (and
                                         (and
                                         (= (rec__traffic_lights__traffic_lightT__last_state_change
                                            (us_split_fields1
                                            temp___expr_191)) time_first)
                                         (= (rec__traffic_lights__traffic_lightT__vehicles_green
                                            (us_split_fields1
                                            temp___expr_191)) (distinct 0 0)))
                                         (and
                                         (and
                                         (and
                                         (= (rec__traffic_lights__traffic_lightT__vehicles_yellow
                                            (us_split_fields1
                                            temp___expr_191)) (distinct 0 0))
                                         (= (rec__traffic_lights__traffic_lightT__vehicles_red
                                            (us_split_fields1
                                            temp___expr_191)) (distinct 1 0)))
                                         (= (rec__traffic_lights__traffic_lightT__pedestrians_green
                                            (us_split_fields1
                                            temp___expr_191)) (distinct 1 0)))
                                         (and
                                         (= (rec__traffic_lights__traffic_lightT__pedestrians_red
                                            (us_split_fields1
                                            temp___expr_191)) (distinct 0 0))
                                         (= (rec__traffic_lights__traffic_lightT__change_state
                                            (us_split_fields1
                                            temp___expr_191)) (distinct 0 0))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort priority 0)

(declare-fun priorityqtint (priority) Int)

;; priority'axiom
  (assert
  (forall ((i priority))
  (and (<= 0 (priorityqtint i)) (<= (priorityqtint i) 97))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 97)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (priority priority) Bool)

(declare-const dummy1 priority)

(declare-datatypes ((priority__ref 0))
(((priority__refqtmk (priority__content priority)))))
(define-fun priority__ref_priority__content__projection ((a priority__ref)) priority 
  (priority__content a))

(define-fun dynamic_invariant ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 97)) (in_range1 temp___expr_169)))

(assert
;; defqtvc
 ;; File "traffic_lights.ads", line 33, characters 0-0
  (not (<= 97 97)))
(check-sat)
(exit)
