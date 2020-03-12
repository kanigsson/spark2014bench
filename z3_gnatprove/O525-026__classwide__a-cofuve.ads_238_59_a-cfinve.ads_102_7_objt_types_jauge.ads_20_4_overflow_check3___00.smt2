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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

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

(declare-datatypes ()
((sequence__ref (sequence__refqtmk (sequence__content us_rep)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep 
  (sequence__content a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (count_type count_type) Bool)

(declare-const dummy1 count_type)

(declare-datatypes ()
((count_type__ref (count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant ((temp___expr_238 Int)
  (temp___is_init_234 Bool) (temp___skip_constant_235 Bool)
  (temp___do_toplevel_236 Bool)
  (temp___do_typ_inv_237 Bool)) Bool (=>
                                     (or (= temp___is_init_234 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_238)))

;; length__post_axiom
  (assert
  (forall ((container us_rep)) (! (in_range1
  (length container)) :pattern ((length container)) )))

(define-fun last ((container us_rep)) Int (+ 0 (length container)))

(declare-fun last__function_guard (Int us_rep) Bool)

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 4))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (extended_index extended_index) Bool)

(declare-const dummy2 extended_index)

(declare-datatypes ()
((extended_index__ref
 (extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__2__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant1 ((temp___expr_272 Int)
  (temp___is_init_268 Bool) (temp___skip_constant_269 Bool)
  (temp___do_toplevel_270 Bool)
  (temp___do_typ_inv_271 Bool)) Bool (=>
                                     (or (= temp___is_init_268 true)
                                     (<= 0 4)) (in_range2 temp___expr_272)))

;; last__post_axiom
  (assert
  (forall ((container us_rep)) (! (in_range2
  (last container)) :pattern ((last container)) )))

(declare-const left us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const right us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const fst Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const lst Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const offset Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort tcount_typeB 0)

(declare-fun tcount_typeBqtint (tcount_typeB) Int)

;; tcount_typeB'axiom
  (assert
  (forall ((i tcount_typeB))
  (and (<= (- 2147483648) (tcount_typeBqtint i))
  (<= (tcount_typeBqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (tcount_typeB tcount_typeB) Bool)

(declare-const dummy3 tcount_typeB)

(declare-datatypes ()
((tcount_typeB__ref
 (tcount_typeB__refqtmk (tcount_typeB__content tcount_typeB)))))
(define-fun tcount_typeB__ref_tcount_typeB__content__projection ((a tcount_typeB__ref)) tcount_typeB 
  (tcount_typeB__content a))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 4))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (index_type index_type) Bool)

(declare-const dummy4 index_type)

(declare-datatypes ()
((index_type__ref (index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__2__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_260 Int)
  (temp___is_init_256 Bool) (temp___skip_constant_257 Bool)
  (temp___do_toplevel_258 Bool)
  (temp___do_typ_inv_259 Bool)) Bool (=>
                                     (or (= temp___is_init_256 true)
                                     (<= 1 4)) (in_range4 temp___expr_260)))

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-datatypes ()
((us_split_fields (us_split_fieldsqtmk (rec__ext__ us_private)))))
(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep1 (us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep1)) Int (attr__tag a))

(define-fun bool_eq1 ((a us_rep1) (b us_rep1)) Bool (ite true true false))

(declare-fun us_dispatch_eq (us_rep1 us_rep1) Bool)

(declare-const us_tag Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ()
((tinterface_jauge__ref
 (tinterface_jauge__refqtmk (tinterface_jauge__content us_rep1)))))
(define-fun tinterface_jauge__ref_tinterface_jauge__content__projection ((a tinterface_jauge__ref)) us_rep1 
  (tinterface_jauge__content a))

(declare-fun oeqR (us_rep1 us_rep1) Bool)

(declare-fun oeqR__function_guard (Bool us_rep1 us_rep1) Bool)

(declare-fun get (us_rep Int) us_rep1)

(declare-fun get__function_guard (us_rep1 us_rep Int) Bool)

(define-fun oeq ((left1 us_rep)
  (right1 us_rep)) Bool (and (= (length left1) (length right1)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left1)))
                                                                (= (oeqR
                                                                   (get left1
                                                                   n)
                                                                   (get
                                                                   right1 n)) true)))
                                                                true false)))

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq a b) (oeq a b)) :pattern ((user_eq a b)) )))

(define-fun default_initial_assumption ((temp___expr_280 us_rep)
  (temp___skip_top_level_281 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_281 true))
                                         (= (length temp___expr_280) 0)))

(define-fun default_initial_assumption1 ((temp___expr_215 us_rep1)
  (temp___skip_top_level_216 Bool)) Bool (= (attr__tag temp___expr_215) 
  us_tag))

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 fst true false true true))

;; Assume
  (assert (dynamic_invariant1 lst true false true true))

;; Assume
  (assert (in_range3 offset))

(declare-const o Bool)

;; H
  (assert (dynamic_invariant1 (last left) true false true true))

;; H
  (assert (let ((o1 left)) (= (last o1) (+ 0 (length o1)))))

;; H
  (assert
  (ite (<= lst (last left))
  (and (or (not (< offset 0)) (in_range3 (- (- 2147483648) offset)))
  (= o (ite (< offset 0) (ite (<= (- (- 2147483648) offset) 1) true false)
       (distinct 1 0))))
  (= o false)))

;; H
  (assert (= o true))

;; H
  (assert (<= fst lst))

(define-fun o1 () Int lst)

;; Ensures
  (assert (in_range3 o1))

(define-fun o2 () Int (length right))

;; H
  (assert (dynamic_invariant o2 true false true true))

;; H
  (assert (<= (+ 0 o2) 4))

(define-fun o3 () Int (+ 0 o2))

(assert
;; defqtvc
 ;; File "a-cofuve.ads", line 217, characters 0-0
  (not (in_range3 o3)))
(check-sat)
