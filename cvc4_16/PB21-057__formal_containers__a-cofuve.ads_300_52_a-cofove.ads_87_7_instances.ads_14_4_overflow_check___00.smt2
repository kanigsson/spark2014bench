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

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep)))))
(define-fun sequence__ref_sequence__content__2__projection ((a sequence__ref)) us_rep 
  (sequence__content a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq1 (count_type count_type) Bool)

(declare-const dummy1 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant ((temp___expr_277 Int)
  (temp___is_init_273 Bool) (temp___skip_constant_274 Bool)
  (temp___do_toplevel_275 Bool)
  (temp___do_typ_inv_276 Bool)) Bool (=>
                                     (or (= temp___is_init_273 true)
                                     (<= 0 2147483647)) (in_range
                                     temp___expr_277)))

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(define-fun last ((container us_rep)) Int (+ 0 (length container)))

(declare-fun last__function_guard (Int us_rep) Bool)

(declare-fun get (us_rep Int) Int)

(declare-fun get__function_guard (Int us_rep Int) Bool)

(define-fun oeq ((left us_rep)
  (right us_rep)) Bool (and (= (length left) (length right)) (ite (forall
                                                                  ((n Int))
                                                                  (=>
                                                                  (and
                                                                  (<= 1 n)
                                                                  (<= n 
                                                                  (last left)))
                                                                  (= 
                                                                  (get left
                                                                  n) 
                                                                  (get right
                                                                  n))))
                                                             true false)))

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq a b) (oeq a b)) :pattern ((user_eq a b)) )))

(define-fun default_initial_assumption ((temp___expr_698 us_rep)
  (temp___skip_top_level_699 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_699 true))
                                         (= (length temp___expr_698) 0)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= (+ 0 result) 1000) (dynamic_invariant result true false true
     true))) :pattern ((length container)) )))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 1000))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (extended_index extended_index) Bool)

(declare-const dummy2 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__3__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant1 ((temp___expr_690 Int)
  (temp___is_init_686 Bool) (temp___skip_constant_687 Bool)
  (temp___do_toplevel_688 Bool)
  (temp___do_typ_inv_689 Bool)) Bool (=>
                                     (or (= temp___is_init_686 true)
                                     (<= 0 1000)) (in_range2
                                     temp___expr_690)))

(declare-const container us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const position Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const new_item Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

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

(declare-datatypes ((tcount_typeB__ref 0))
(((tcount_typeB__refqtmk (tcount_typeB__content tcount_typeB)))))
(define-fun tcount_typeB__ref_tcount_typeB__content__projection ((a tcount_typeB__ref)) tcount_typeB 
  (tcount_typeB__content a))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 1000))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (index_type index_type) Bool)

(declare-const dummy4 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__3__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_676 Int)
  (temp___is_init_672 Bool) (temp___skip_constant_673 Bool)
  (temp___do_toplevel_674 Bool)
  (temp___do_typ_inv_675 Bool)) Bool (=>
                                     (or (= temp___is_init_672 true)
                                     (<= 1 1000)) (in_range4
                                     temp___expr_676)))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (element_type element_type) Bool)

(declare-const dummy5 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__5__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant3 ((temp___expr_683 Int)
  (temp___is_init_679 Bool) (temp___skip_constant_680 Bool)
  (temp___do_toplevel_681 Bool)
  (temp___do_typ_inv_682 Bool)) Bool (=>
                                     (or (= temp___is_init_679 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range5 temp___expr_683)))

;; get__post_axiom
  (assert
  (forall ((container1 us_rep))
  (forall ((position1 Int))
  (! (=>
     (and (dynamic_invariant1 position1 true true true true)
     (and (<= 1 position1) (<= position1 (last container1))))
     (dynamic_invariant3 (get container1 position1) true false true true)) :pattern (
  (get container1 position1)) ))))

(assert
;; defqtvc
 ;; File "a-cofuve.ads", line 288, characters 0-0
  (not
  (=> (dynamic_invariant2 position true false true true)
  (=> (dynamic_invariant3 new_item true false true true)
  (let ((o (length container)))
  (=> (and (dynamic_invariant o true false true true) (<= (+ 0 o) 1000))
  (=>
  (or (not (< o 2147483647))
  (let ((o1 container))
  (let ((o2 (last o1)))
  (and (dynamic_invariant1 o2 true false true true) (= o2 (+ 0 (length o1)))))))
  (=> (and (< o 2147483647) (< (last container) 1000))
  (let ((o1 container))
  (let ((o2 (last o1)))
  (=>
  (and (dynamic_invariant1 o2 true false true true) (= o2 (+ 0 (length o1))))
  (not (= o2 2147483647)))))))))))))
(check-sat)
(exit)
