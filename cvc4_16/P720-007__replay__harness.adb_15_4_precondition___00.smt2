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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const z Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort ar_index 0)

(declare-fun ar_indexqtint (ar_index) Int)

;; ar_index'axiom
  (assert
  (forall ((i ar_index))
  (and (<= 0 (ar_indexqtint i)) (<= (ar_indexqtint i) 9999))))

(define-fun in_range1 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 9999)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (ar_index ar_index) Bool)

(declare-const dummy1 ar_index)

(declare-datatypes ((ar_index__ref 0))
(((ar_index__refqtmk (ar_index__content ar_index)))))
(define-fun ar_index__ref_ar_index__content__projection ((a ar_index__ref)) ar_index 
  (ar_index__content a))

(define-fun to_rep ((x1 ar_index)) Int (ar_indexqtint x1))

(declare-fun of_rep (Int) ar_index)

;; inversion_axiom
  (assert
  (forall ((x1 ar_index))
  (! (= (of_rep (to_rep x1)) x1) :pattern ((to_rep x1)) )))

;; range_axiom
  (assert
  (forall ((x1 ar_index)) (! (in_range1
  (to_rep x1)) :pattern ((to_rep x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range1 x1) (= (to_rep (of_rep x1)) x1)) :pattern ((to_rep
                                                               (of_rep x1))) )))

(define-fun to_rep1 ((x1 integer)) Int (integerqtint x1))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x1 integer))
  (! (= (of_rep1 (to_rep1 x1)) x1) :pattern ((to_rep1 x1)) )))

;; range_axiom
  (assert
  (forall ((x1 integer)) (! (in_range
  (to_rep1 x1)) :pattern ((to_rep1 x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range x1) (= (to_rep1 (of_rep1 x1)) x1)) :pattern ((to_rep1
                                                                (of_rep1 x1))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array Int integer))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq2 ((Array Int integer) (Array Int integer)) Bool)

(declare-sort length_type 0)

(declare-fun length_typeqtint (length_type) Int)

;; length_type'axiom
  (assert
  (forall ((i length_type))
  (and (<= 0 (length_typeqtint i)) (<= (length_typeqtint i) 10000))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (length_type length_type) Bool)

(declare-const dummy3 length_type)

(declare-datatypes ((length_type__ref 0))
(((length_type__refqtmk (length_type__content length_type)))))
(define-fun length_type__ref_length_type__content__projection ((a length_type__ref)) length_type 
  (length_type__content a))

(define-fun to_rep2 ((x1 length_type)) Int (length_typeqtint x1))

(declare-fun of_rep2 (Int) length_type)

;; inversion_axiom
  (assert
  (forall ((x1 length_type))
  (! (= (of_rep2 (to_rep2 x1)) x1) :pattern ((to_rep2 x1)) )))

;; range_axiom
  (assert
  (forall ((x1 length_type)) (! (in_range2
  (to_rep2 x1)) :pattern ((to_rep2 x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range2 x1) (= (to_rep2 (of_rep2 x1)) x1)) :pattern ((to_rep2
                                                                 (of_rep2 x1))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__ring_buf__ring_buffer__data (Array Int integer))(rec__ring_buf__ring_buffer__first ar_index)(rec__ring_buf__ring_buffer__length length_type)))))
(define-fun us_split_fields_rec__ring_buf__ring_buffer__data__projection ((a us_split_fields)) (Array Int integer) 
  (rec__ring_buf__ring_buffer__data a))

(define-fun us_split_fields_rec__ring_buf__ring_buffer__first__projection ((a us_split_fields)) ar_index 
  (rec__ring_buf__ring_buffer__first a))

(define-fun us_split_fields_rec__ring_buf__ring_buffer__length__projection ((a us_split_fields)) length_type 
  (rec__ring_buf__ring_buffer__length a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (bool_eq
                           (rec__ring_buf__ring_buffer__data
                           (us_split_fields1 a)) 0 9999
                           (rec__ring_buf__ring_buffer__data
                           (us_split_fields1 b)) 0 9999) true)
                        (= (to_rep
                           (rec__ring_buf__ring_buffer__first
                           (us_split_fields1 a))) (to_rep
                                                  (rec__ring_buf__ring_buffer__first
                                                  (us_split_fields1 b)))))
                        (= (to_rep2
                           (rec__ring_buf__ring_buffer__length
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__ring_buf__ring_buffer__length
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const ring_buf__ring_buffer__data__first__bit Int)

(declare-const ring_buf__ring_buffer__data__last__bit Int)

(declare-const ring_buf__ring_buffer__data__position Int)

;; ring_buf__ring_buffer__data__first__bit_axiom
  (assert (<= 0 ring_buf__ring_buffer__data__first__bit))

;; ring_buf__ring_buffer__data__last__bit_axiom
  (assert
  (< ring_buf__ring_buffer__data__first__bit ring_buf__ring_buffer__data__last__bit))

;; ring_buf__ring_buffer__data__position_axiom
  (assert (<= 0 ring_buf__ring_buffer__data__position))

(declare-const ring_buf__ring_buffer__first__first__bit Int)

(declare-const ring_buf__ring_buffer__first__last__bit Int)

(declare-const ring_buf__ring_buffer__first__position Int)

;; ring_buf__ring_buffer__first__first__bit_axiom
  (assert (<= 0 ring_buf__ring_buffer__first__first__bit))

;; ring_buf__ring_buffer__first__last__bit_axiom
  (assert
  (< ring_buf__ring_buffer__first__first__bit ring_buf__ring_buffer__first__last__bit))

;; ring_buf__ring_buffer__first__position_axiom
  (assert (<= 0 ring_buf__ring_buffer__first__position))

(declare-const ring_buf__ring_buffer__length__first__bit Int)

(declare-const ring_buf__ring_buffer__length__last__bit Int)

(declare-const ring_buf__ring_buffer__length__position Int)

;; ring_buf__ring_buffer__length__first__bit_axiom
  (assert (<= 0 ring_buf__ring_buffer__length__first__bit))

;; ring_buf__ring_buffer__length__last__bit_axiom
  (assert
  (< ring_buf__ring_buffer__length__first__bit ring_buf__ring_buffer__length__last__bit))

;; ring_buf__ring_buffer__length__position_axiom
  (assert (<= 0 ring_buf__ring_buffer__length__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((ring_buffer__ref 0))
(((ring_buffer__refqtmk (ring_buffer__content us_rep)))))
(define-fun ring_buffer__ref_ring_buffer__content__projection ((a ring_buffer__ref)) us_rep 
  (ring_buffer__content a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

(declare-fun is_full (us_rep) Bool)

(declare-fun is_full__function_guard (Bool us_rep) Bool)

(declare-fun head (us_rep) Int)

(declare-fun head__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant1 ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= 0 9999)) (in_range1
                                     temp___expr_162)))

(define-fun dynamic_invariant2 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 0 10000)) (in_range2
                                     temp___expr_179)))

;; is_full__post_axiom
  (assert true)

;; is_full__def_axiom
  (assert
  (forall ((r us_rep))
  (! (= (= (is_full r) true)
     (= (to_rep2 (rec__ring_buf__ring_buffer__length (us_split_fields1 r))) 10000)) :pattern (
  (is_full r)) )))

;; is_empty__post_axiom
  (assert true)

;; is_empty__def_axiom
  (assert
  (forall ((r us_rep))
  (! (= (= (is_empty r) true)
     (= (to_rep2 (rec__ring_buf__ring_buffer__length (us_split_fields1 r))) 0)) :pattern (
  (is_empty r)) )))

;; head__post_axiom
  (assert
  (forall ((r us_rep))
  (! (and (forall ((r1 us_rep)) (is_empty__function_guard (is_empty r1) r1))
     (=> (not (= (is_empty r) true))
     (let ((result (head r)))
     (=> (head__function_guard result r) (dynamic_invariant result true false
     true true))))) :pattern ((head r)) )))

;; head__def_axiom
  (assert
  (forall ((r us_rep))
  (! (= (head r) (to_rep1
                 (let ((temp___209 (rec__ring_buf__ring_buffer__data
                                   (us_split_fields1 r))))
                 (select temp___209 (to_rep
                                    (rec__ring_buf__ring_buffer__first
                                    (us_split_fields1 r))))))) :pattern (
  (head r)) )))

(assert
;; defqtvc
 ;; File "harness.adb", line 3, characters 0-0
  (not
  (forall ((h Int) (r__split_fields us_split_fields)
  (r__split_fields1 us_split_fields) (r__split_fields2 us_split_fields)
  (r__split_fields3 us_split_fields) (h1 Int)
  (r__split_fields4 us_split_fields))
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant y true false true true)
  (=> (dynamic_invariant z true false true true)
  (=> (dynamic_invariant h false false true true)
  (=>
  (forall ((r__split_fields5 us_split_fields)) (is_empty__function_guard
  (is_empty (us_repqtmk r__split_fields5)) (us_repqtmk r__split_fields5)))
  (=> (= (is_empty (us_repqtmk r__split_fields)) true)
  (=>
  (= (to_rep2 (rec__ring_buf__ring_buffer__length r__split_fields1)) (+ 
  (to_rep2 (rec__ring_buf__ring_buffer__length r__split_fields)) 1))
  (=>
  (= (to_rep2 (rec__ring_buf__ring_buffer__length r__split_fields2)) (+ 
  (to_rep2 (rec__ring_buf__ring_buffer__length r__split_fields1)) 1))
  (=>
  (= (to_rep2 (rec__ring_buf__ring_buffer__length r__split_fields3)) (- 
  (to_rep2 (rec__ring_buf__ring_buffer__length r__split_fields2)) 1))
  (=>
  (forall ((r__split_fields5 us_split_fields)) (head__function_guard
  (head (us_repqtmk r__split_fields5)) (us_repqtmk r__split_fields5)))
  (=> (= (head (us_repqtmk r__split_fields2)) h1)
  (=> (dynamic_invariant h1 true true true true)
  (=> (= h1 x)
  (=>
  (= (to_rep2 (rec__ring_buf__ring_buffer__length r__split_fields4)) (+ 
  (to_rep2 (rec__ring_buf__ring_buffer__length r__split_fields3)) 1))
  (=>
  (forall ((r__split_fields5 us_split_fields)) (is_empty__function_guard
  (is_empty (us_repqtmk r__split_fields5)) (us_repqtmk r__split_fields5)))
  (not (= (is_empty (us_repqtmk r__split_fields4)) true))))))))))))))))))))
(check-sat)
(exit)
