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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__r__discr Bool)))))
(define-fun us_split_discrs_rec__p__r__discr__projection ((a us_split_discrs)) Bool 
  (rec__p__r__discr a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__r us_main_type)))))
(define-fun us_split_fields_rec__p__r__projection ((a us_split_fields)) us_main_type 
  (rec__p__r a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__p__r__discr (us_split_discrs1 a)) 1 0) (ite 
                        (rec__p__r__discr (us_split_discrs1 b)) 1 0))
                        (= (us_main_eq (rec__p__r (us_split_fields1 a))
                           (rec__p__r (us_split_fields1 b))) true))
                   true false))

(define-fun in_range1 ((rec__p__r__discr1 Bool)
  (a us_split_discrs)) Bool (= rec__p__r__discr1 (rec__p__r__discr a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const p__r__discr__first__bit Int)

(declare-const p__r__discr__last__bit Int)

(declare-const p__r__discr__position Int)

;; p__r__discr__first__bit_axiom
  (assert (<= 0 p__r__discr__first__bit))

;; p__r__discr__last__bit_axiom
  (assert (< p__r__discr__first__bit p__r__discr__last__bit))

;; p__r__discr__position_axiom
  (assert (<= 0 p__r__discr__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-const a us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const p__r__discr__first__bit1 Int)

(declare-const p__r__discr__last__bit1 Int)

(declare-const p__r__discr__position1 Int)

;; p__r__discr__first__bit_axiom
  (assert (<= 0 p__r__discr__first__bit1))

;; p__r__discr__last__bit_axiom
  (assert (< p__r__discr__first__bit1 p__r__discr__last__bit1))

;; p__r__discr__position_axiom
  (assert (<= 0 p__r__discr__position1))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a1 t__ref)) us_rep (t__content
                                                               a1))

(define-fun dynamic_invariant ((temp___expr_164 us_rep)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (not (= temp___skip_constant_161 true))
                                     (in_range1 (distinct 0 0)
                                     (us_split_discrs1 temp___expr_164))))

(define-fun default_initial_assumption ((temp___expr_166 us_rep)
  (temp___skip_top_level_167 Bool)) Bool (= (rec__p__r__discr
                                            (us_split_discrs1
                                            temp___expr_166)) (distinct 0 0)))

(assert
;; defqtvc
 ;; File "q.adb", line 5, characters 0-0
  (not (in_range1 (distinct 0 0) (us_split_discrs1 a))))
(check-sat)
(exit)
