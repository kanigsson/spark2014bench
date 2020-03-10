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

(declare-sort t_nat32 0)

(declare-fun t_nat32qtint (t_nat32) Int)

;; t_nat32'axiom
  (assert
  (forall ((i t_nat32))
  (and (<= 0 (t_nat32qtint i)) (<= (t_nat32qtint i) 4294967295))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 4294967295)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (t_nat32 t_nat32) Bool)

(declare-const dummy t_nat32)

(declare-datatypes ((t_nat32__ref 0))
(((t_nat32__refqtmk (t_nat32__content t_nat32)))))
(define-fun t_nat32__ref_t_nat32__content__projection ((a t_nat32__ref)) t_nat32 
  (t_nat32__content a))

(define-fun to_rep ((x t_nat32)) Int (t_nat32qtint x))

(declare-fun of_rep (Int) t_nat32)

;; inversion_axiom
  (assert
  (forall ((x t_nat32)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x t_nat32)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort t_data_type 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t_data_type t_data_type) Bool)

(declare-const dummy1 t_data_type)

(declare-datatypes ((t_data_type__ref 0))
(((t_data_type__refqtmk (t_data_type__content t_data_type)))))
(define-fun t_data_type__ref_t_data_type__content__projection ((a t_data_type__ref)) t_data_type 
  (t_data_type__content a))

(declare-fun to_rep1 (t_data_type) Int)

(declare-fun of_rep1 (Int) t_data_type)

;; inversion_axiom
  (assert
  (forall ((x t_data_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x t_data_type)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__data__t_strong_data_type__data_type t_data_type)))))
(define-fun us_split_discrs_rec__data__t_strong_data_type__data_type__projection ((a us_split_discrs)) t_data_type 
  (rec__data__t_strong_data_type__data_type a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__data__t_strong_data_type__min_nat32 t_nat32)))))
(define-fun us_split_fields_rec__data__t_strong_data_type__min_nat32__projection ((a us_split_fields)) t_nat32 
  (rec__data__t_strong_data_type__min_nat32 a))

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

(define-fun data__t_strong_data_type__min_nat32__pred ((a us_rep)) Bool (= 
  (to_rep1 (rec__data__t_strong_data_type__data_type (us_split_discrs1 a))) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__data__t_strong_data_type__data_type
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__data__t_strong_data_type__data_type
                                                  (us_split_discrs1 b))))
                        (=> (data__t_strong_data_type__min_nat32__pred a)
                        (= (to_rep
                           (rec__data__t_strong_data_type__min_nat32
                           (us_split_fields1 a))) (to_rep
                                                  (rec__data__t_strong_data_type__min_nat32
                                                  (us_split_fields1 b))))))
                   true false))

(define-fun in_range2 ((rec__data__t_strong_data_type__data_type1 Int)
  (a us_split_discrs)) Bool (= rec__data__t_strong_data_type__data_type1 
  (to_rep1 (rec__data__t_strong_data_type__data_type a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const data__t_strong_data_type__data_type__first__bit Int)

(declare-const data__t_strong_data_type__data_type__last__bit Int)

(declare-const data__t_strong_data_type__data_type__position Int)

;; data__t_strong_data_type__data_type__first__bit_axiom
  (assert (<= 0 data__t_strong_data_type__data_type__first__bit))

;; data__t_strong_data_type__data_type__last__bit_axiom
  (assert
  (< data__t_strong_data_type__data_type__first__bit data__t_strong_data_type__data_type__last__bit))

;; data__t_strong_data_type__data_type__position_axiom
  (assert (<= 0 data__t_strong_data_type__data_type__position))

(declare-const data__t_strong_data_type__min_nat32__first__bit Int)

(declare-const data__t_strong_data_type__min_nat32__last__bit Int)

(declare-const data__t_strong_data_type__min_nat32__position Int)

;; data__t_strong_data_type__min_nat32__first__bit_axiom
  (assert (<= 0 data__t_strong_data_type__min_nat32__first__bit))

;; data__t_strong_data_type__min_nat32__last__bit_axiom
  (assert
  (< data__t_strong_data_type__min_nat32__first__bit data__t_strong_data_type__min_nat32__last__bit))

;; data__t_strong_data_type__min_nat32__position_axiom
  (assert (<= 0 data__t_strong_data_type__min_nat32__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t_strong_data_type__ref 0))
(((t_strong_data_type__refqtmk (t_strong_data_type__content us_rep)))))
(define-fun t_strong_data_type__ref_t_strong_data_type__content__projection ((a t_strong_data_type__ref)) us_rep 
  (t_strong_data_type__content a))

(declare-fun is_nat32 (us_rep) Bool)

(declare-fun is_nat32__function_guard (Bool us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_177 us_rep)
  (temp___skip_top_level_178 Bool)) Bool (= (to_rep1
                                            (rec__data__t_strong_data_type__data_type
                                            (us_split_discrs1
                                            temp___expr_177))) 0))

;; is_nat32__post_axiom
  (assert true)

;; is_nat32__def_axiom
  (assert
  (forall ((strong_data_type us_rep))
  (! (= (= (is_nat32 strong_data_type) true)
     (= (to_rep1
        (rec__data__t_strong_data_type__data_type
        (us_split_discrs1 strong_data_type))) 1)) :pattern ((is_nat32
                                                            strong_data_type)) )))

(declare-fun get_min_nat32 (us_rep) Int)

(declare-fun get_min_nat32__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 0 4294967295)) (in_range
                                     temp___expr_161)))

;; get_min_nat32__post_axiom
  (assert
  (forall ((strong_data_type us_rep))
  (! (and
     (forall ((strong_data_type1 us_rep)) (is_nat32__function_guard
     (is_nat32 strong_data_type1) strong_data_type1))
     (=> (= (is_nat32 strong_data_type) true)
     (let ((result (get_min_nat32 strong_data_type)))
     (=> (get_min_nat32__function_guard result strong_data_type)
     (dynamic_invariant result true false true true))))) :pattern ((get_min_nat32
                                                                   strong_data_type)) )))

;; get_min_nat32__def_axiom
  (assert
  (forall ((strong_data_type us_rep))
  (! (= (get_min_nat32 strong_data_type) (to_rep
                                         (rec__data__t_strong_data_type__min_nat32
                                         (us_split_fields1 strong_data_type)))) :pattern (
  (get_min_nat32 strong_data_type)) )))

(declare-const min Int)

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

(declare-const data__t_strong_data_type__data_type__first__bit1 Int)

(declare-const data__t_strong_data_type__data_type__last__bit1 Int)

(declare-const data__t_strong_data_type__data_type__position1 Int)

;; data__t_strong_data_type__data_type__first__bit_axiom
  (assert (<= 0 data__t_strong_data_type__data_type__first__bit1))

;; data__t_strong_data_type__data_type__last__bit_axiom
  (assert
  (< data__t_strong_data_type__data_type__first__bit1 data__t_strong_data_type__data_type__last__bit1))

;; data__t_strong_data_type__data_type__position_axiom
  (assert (<= 0 data__t_strong_data_type__data_type__position1))

(declare-const data__t_strong_data_type__min_nat32__first__bit1 Int)

(declare-const data__t_strong_data_type__min_nat32__last__bit1 Int)

(declare-const data__t_strong_data_type__min_nat32__position1 Int)

;; data__t_strong_data_type__min_nat32__first__bit_axiom
  (assert (<= 0 data__t_strong_data_type__min_nat32__first__bit1))

;; data__t_strong_data_type__min_nat32__last__bit_axiom
  (assert
  (< data__t_strong_data_type__min_nat32__first__bit1 data__t_strong_data_type__min_nat32__last__bit1))

;; data__t_strong_data_type__min_nat32__position_axiom
  (assert (<= 0 data__t_strong_data_type__min_nat32__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t7s__ref 0))
(((t7s__refqtmk (t7s__content us_rep)))))
(define-fun t7s__ref_t7s__content__projection ((a t7s__ref)) us_rep (t7s__content
                                                                    a))

(define-fun dynamic_invariant1 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 0 1)) (in_range1 temp___expr_168)))

(assert
;; defqtvc
 ;; File "data.ads", line 13, characters 0-0
  (not
  (forall ((o t_nat32) (o1 t_data_type) (data__create_type__result us_rep))
  (=> (dynamic_invariant min true false true true)
  (=> (= (to_rep o) min)
  (=> (= (to_rep1 o1) 1)
  (=>
  (= data__create_type__result (us_repqtmk (us_split_discrsqtmk o1)
                               (us_split_fieldsqtmk o)))
  (=>
  (forall ((data__create_type__result1 us_rep)) (is_nat32__function_guard
  (is_nat32 data__create_type__result1) data__create_type__result1))
  (= (is_nat32 data__create_type__result) true)))))))))
(check-sat)
(exit)
