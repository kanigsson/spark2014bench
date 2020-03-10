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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

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

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__use_lists__my_lists__list us_main_type1)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__use_lists__my_lists__list__projection ((a us_split_fields)) us_main_type1 
  (rec__use_lists__my_lists__list a))

(define-fun us_split_fields_rec__ext____4__projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__5__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__5__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__4__projection ((a us_rep1)) Int (attr__tag a))

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

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep1)))))
(define-fun list__ref_list__content__3__projection ((a list__ref)) us_rep1 
  (list__content a))

(declare-fun length (us_rep1) Int)

(declare-fun length__function_guard (Int us_rep1) Bool)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-fun capacity (us_rep1) Int)

(declare-fun capacity__function_guard (Int us_rep1) Bool)

;; length__post_axiom
  (assert
  (forall ((l us_rep1)) (! (in_range2 (length l)) :pattern ((length l)) )))

(declare-sort us_main_type2 0)

(declare-fun us_main_eq2 (us_main_type2 us_main_type2) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq1 (us_rep2 us_rep2) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq4 (us_rep2 us_rep2) Bool)

(declare-const dummy4 us_rep2)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep2)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep2 
  (sequence__content a))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((cursor__ref1 0))
(((cursor__refqtmk1 (cursor__content1 us_rep)))))
(define-fun cursor__ref_cursor__content__2__projection ((a cursor__ref1)) us_rep 
  (cursor__content1 a))

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content us_rep)))))
(define-fun element_type__ref_element_type__content__9__projection ((a element_type__ref)) us_rep 
  (element_type__content a))

(declare-fun find (us_rep2 us_rep us_type_of_heap) Int)

(declare-fun find__function_guard (Int us_rep2 us_rep us_type_of_heap) Bool)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-fun get (us_rep2 Int) us_rep)

(declare-fun get__function_guard (us_rep us_rep2 Int) Bool)

(declare-fun length1 (us_rep2) Int)

(declare-fun length__function_guard1 (Int us_rep2) Bool)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; find__post_axiom
  (assert
  (forall ((s us_rep2))
  (forall ((e us_rep))
  (forall ((us_HEAP us_type_of_heap)) (! (in_range1
  (find s e us_HEAP)) :pattern ((find s e us_HEAP)) )))))

(declare-sort us_main_type3 0)

(declare-fun us_main_eq3 (us_main_type3 us_main_type3) Bool)

(declare-sort us_rep3 0)

(declare-fun bool_eq2 (us_rep3 us_rep3) Bool)

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-fun user_eq6 (us_rep3 us_rep3) Bool)

(declare-const dummy6 us_rep3)

(declare-datatypes ((sequence__ref1 0))
(((sequence__refqtmk1 (sequence__content1 us_rep3)))))
(define-fun sequence__ref_sequence__content__2__projection ((a sequence__ref1)) us_rep3 
  (sequence__content1 a))

(declare-fun get1 (us_rep3 Int) Int)

(declare-fun get__function_guard1 (Int us_rep3 Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq7 (element_type element_type) Bool)

(declare-const dummy7 element_type)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type)))))
(define-fun element_type__ref_element_type__content__10__projection ((a element_type__ref1)) element_type 
  (element_type__content1 a))

(define-fun dynamic_invariant2 ((temp___expr_593 Int)
  (temp___is_init_589 Bool) (temp___skip_constant_590 Bool)
  (temp___do_toplevel_591 Bool)
  (temp___do_typ_inv_592 Bool)) Bool (=>
                                     (or (= temp___is_init_589 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_593)))

;; get__post_axiom
  (assert
  (forall ((s us_rep3))
  (forall ((n Int)) (! (in_range3 (get1 s n)) :pattern ((get1 s n)) ))))

(declare-fun get_cursor_model (us_rep1 us_type_of_heap) us_rep2)

(declare-fun get_cursor_model__function_guard (us_rep2 us_rep1
  us_type_of_heap) Bool)

(declare-fun oeq1 (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard1 (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (and
     (forall ((a1 us_rep2) (b1 us_rep2)) (oeq__function_guard1 (oeq1 a1 b1)
     a1 b1)) (= (user_eq4 a b) (oeq1 a b))) :pattern ((user_eq4 a b)) )))

(declare-fun get_element_model (us_rep1 us_type_of_heap) us_rep3)

(declare-fun get_element_model__function_guard (us_rep3 us_rep1
  us_type_of_heap) Bool)

(declare-fun length2 (us_rep3) Int)

(declare-fun length__function_guard2 (Int us_rep3) Bool)

(declare-fun oeq2 (us_rep3 us_rep3) Bool)

(declare-fun oeq__function_guard2 (Bool us_rep3 us_rep3) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep3) (b us_rep3))
  (! (and
     (forall ((a1 us_rep3) (b1 us_rep3)) (oeq__function_guard2 (oeq2 a1 b1)
     a1 b1)) (= (user_eq6 a b) (oeq2 a b))) :pattern ((user_eq6 a b)) )))

(declare-fun element (us_rep1 us_rep us_type_of_heap) Int)

(declare-fun element__function_guard (Int us_rep1 us_rep
  us_type_of_heap) Bool)

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= (- 2147483648) (element_typeqtint1 i))
  (<= (element_typeqtint1 i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq8 (element_type1 element_type1) Bool)

(declare-const dummy8 element_type1)

(declare-datatypes ((element_type__ref2 0))
(((element_type__refqtmk2 (element_type__content2 element_type1)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref2)) element_type1 
  (element_type__content2 a))

(define-fun dynamic_invariant3 ((temp___expr_214 Int)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (=>
                                     (or (= temp___is_init_210 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range4 temp___expr_214)))

;; element__post_axiom
  (assert
  (forall ((l us_rep1))
  (forall ((c us_rep))
  (forall ((us_HEAP us_type_of_heap)) (! (in_range4
  (element l c us_HEAP)) :pattern ((element l c us_HEAP)) )))))

(declare-fun first (us_rep1 us_type_of_heap) us_rep)

(declare-fun first__function_guard (us_rep us_rep1 us_type_of_heap) Bool)

(declare-fun has_element (us_rep1 us_rep us_type_of_heap) Bool)

(declare-fun has_element__function_guard (Bool us_rep1 us_rep
  us_type_of_heap) Bool)

;; temp___result_523'def
  (assert
  (forall ((temp___522 us_rep1)) (length__function_guard (length temp___522)
  temp___522)))

(define-fun default_initial_assumption ((temp___expr_520 us_rep1)
  (temp___skip_top_level_521 Bool)) Bool (and
                                         (= (attr__tag temp___expr_520) 
                                         us_tag)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_521 true))
                                         (= (length temp___expr_520) 0))))

(declare-fun snoc (us_rep2 us_rep us_type_of_heap) us_rep2)

(declare-fun snoc__function_guard (us_rep2 us_rep2 us_rep
  us_type_of_heap) Bool)

(declare-fun snoc1 (us_rep3 Int us_type_of_heap) us_rep3)

(declare-fun snoc__function_guard1 (us_rep3 us_rep3 Int
  us_type_of_heap) Bool)

(declare-fun is_incr (Int Int) Bool)

(declare-fun is_incr__function_guard (Bool Int Int) Bool)

;; is_incr__post_axiom
  (assert true)

;; is_incr__def_axiom
  (assert
  (forall ((i1 Int) (i2 Int))
  (! (= (= (is_incr i1 i2) true)
     (ite (= i1 2147483647) (= i2 2147483647) (= i2 (+ i1 1)))) :pattern (
  (is_incr i1 i2)) )))

(declare-const l1 us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const l2__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

;; capacity__post_axiom
  (assert
  (forall ((l us_rep1)) (! (in_range2
  (capacity l)) :pattern ((capacity l)) )))

;; length__post_axiom
  (assert
  (forall ((s us_rep2)) (! (in_range2 (length1 s)) :pattern ((length1 s)) )))

;; oeq__def_axiom
  (assert
  (forall ((s1 us_rep2) (s2 us_rep2))
  (! (and
     (forall ((s11 us_rep2)) (length__function_guard1 (length1 s11) s11))
     (and
     (forall ((s21 us_rep2)) (length__function_guard1 (length1 s21) s21))
     (and
     (forall ((s11 us_rep2)) (length__function_guard1 (length1 s11) s11))
     (and
     (forall ((s11 us_rep2) (n Int)) (get__function_guard (get s11 n) s11 n))
     (and
     (forall ((s21 us_rep2) (n Int)) (get__function_guard (get s21 n) s21 n))
     (= (= (oeq1 s1 s2) true)
     (and (= (length1 s1) (length1 s2))
     (forall ((n Int))
     (=> (and (<= 0 n) (<= n (- (length1 s1) 1)))
     (= (bool_eq (get s1 n) (get s2 n)) true)))))))))) :pattern ((oeq1 s1 s2)) )))

;; oeq__post_axiom
  (assert true)

;; length__post_axiom
  (assert
  (forall ((s us_rep3)) (! (in_range2 (length2 s)) :pattern ((length2 s)) )))

;; oeq__def_axiom
  (assert
  (forall ((s1 us_rep3) (s2 us_rep3))
  (! (and
     (forall ((s11 us_rep3)) (length__function_guard2 (length2 s11) s11))
     (and
     (forall ((s21 us_rep3)) (length__function_guard2 (length2 s21) s21))
     (and
     (forall ((s11 us_rep3)) (length__function_guard2 (length2 s11) s11))
     (and
     (forall ((s11 us_rep3) (n Int)) (get__function_guard1 (get1 s11 n) s11
     n))
     (and
     (forall ((s21 us_rep3) (n Int)) (get__function_guard1 (get1 s21 n) s21
     n))
     (= (= (oeq2 s1 s2) true)
     (and (= (length2 s1) (length2 s2))
     (forall ((n Int))
     (=> (and (<= 0 n) (<= n (- (length2 s1) 1)))
     (= (get1 s1 n) (get1 s2 n))))))))))) :pattern ((oeq2 s1 s2)) )))

(assert
;; defqtvc
 ;; File "use_lists.ads", line 16, characters 0-0
  (not
  (forall ((l2__split_fields us_split_fields))
  (let ((o l1))
  (forall ((us_HEAP us_type_of_heap))
  (let ((o1 (first o us_HEAP)))
  (=> (forall ((o2 us_rep1)) (length__function_guard (length o2) o2))
  (=>
  (forall ((o2 us_rep1) (us_HEAP1 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o2 us_HEAP1) o2
  us_HEAP1))
  (=>
  (forall ((o2 us_rep1) (us_HEAP1 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o2 us_HEAP1) o2
  us_HEAP1))
  (=>
  (forall ((o2 us_rep1) (us_HEAP1 us_type_of_heap) (o3 us_rep))
  (find__function_guard (find (get_cursor_model o2 us_HEAP1) o3 us_HEAP1)
  (get_cursor_model o2 us_HEAP1) o3 us_HEAP1))
  (=>
  (forall ((o2 us_rep1) (us_HEAP1 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o2 us_HEAP1) o2
  us_HEAP1))
  (=>
  (forall ((o2 us_rep1) (us_HEAP1 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o2 us_HEAP1) o2
  us_HEAP1))
  (=>
  (forall ((o2 us_rep1) (us_HEAP1 us_type_of_heap)) (get__function_guard
  (get (get_cursor_model o2 us_HEAP1) 0) (get_cursor_model o2 us_HEAP1) 0))
  (=>
  (and (first__function_guard o1 o us_HEAP)
  (ite (= (length o) 0)
  (= (find (get_cursor_model o us_HEAP) o1 us_HEAP) (- 1))
  (= (bool_eq o1 (get (get_cursor_model o us_HEAP) 0)) true)))
  (forall ((cu us_rep))
  (=> (= cu o1)
  (let ((o2 l2__attr__tag))
  (forall ((l2__split_fields1 us_split_fields))
  (=>
  (forall ((o3 Int) (l2__split_fields2 us_split_fields))
  (capacity__function_guard (capacity (us_repqtmk l2__split_fields2 o3))
  (us_repqtmk l2__split_fields2 o3)))
  (=>
  (forall ((l2__split_fields2 us_split_fields) (o3 Int))
  (capacity__function_guard (capacity (us_repqtmk l2__split_fields2 o3))
  (us_repqtmk l2__split_fields2 o3)))
  (=>
  (forall ((o3 Int) (l2__split_fields2 us_split_fields))
  (length__function_guard (length (us_repqtmk l2__split_fields2 o3))
  (us_repqtmk l2__split_fields2 o3)))
  (=>
  (and
  (= (capacity (us_repqtmk l2__split_fields1 o2)) (capacity
                                                  (us_repqtmk
                                                  l2__split_fields o2)))
  (= (length (us_repqtmk l2__split_fields1 o2)) 0))
  (let ((o3 l1))
  (forall ((us_HEAP1 us_type_of_heap))
  (let ((o4 (has_element o3 cu us_HEAP1)))
  (=>
  (forall ((o5 us_rep1) (us_HEAP2 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o5 us_HEAP2) o5
  us_HEAP2))
  (=>
  (forall ((o5 us_rep1) (us_HEAP2 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o5 us_HEAP2) o5
  us_HEAP2))
  (=>
  (forall ((cu1 us_rep) (o5 us_rep1) (us_HEAP2 us_type_of_heap))
  (find__function_guard (find (get_cursor_model o5 us_HEAP2) cu1 us_HEAP2)
  (get_cursor_model o5 us_HEAP2) cu1 us_HEAP2))
  (=>
  (and (has_element__function_guard o4 o3 cu us_HEAP1)
  (= (= o4 true) (<= 0 (find (get_cursor_model o3 us_HEAP1) cu us_HEAP1))))
  (=> (= o4 true)
  (let ((o5 (us_repqtmk l2__split_fields1 l2__attr__tag)))
  (let ((o6 (length o5)))
  (=> (forall ((o7 us_rep1)) (capacity__function_guard (capacity o7) o7))
  (=>
  (and (length__function_guard o6 o5)
  (and (dynamic_invariant o6 true false true true) (< o6 (capacity o5))))
  (let ((o7 l1))
  (forall ((us_HEAP2 us_type_of_heap))
  (let ((o8 (get_cursor_model o7 us_HEAP2)))
  (=> (forall ((o9 us_rep2)) (length__function_guard1 (length1 o9) o9))
  (=> (forall ((o9 us_rep1)) (length__function_guard (length o9) o9))
  (=> (forall ((o9 us_rep1)) (length__function_guard (length o9) o9))
  (=> (forall ((o9 us_rep2) (n Int)) (get__function_guard (get o9 n) o9 n))
  (=> (forall ((o9 us_rep2) (n Int)) (get__function_guard (get o9 n) o9 n))
  (=>
  (forall ((us_HEAP3 us_type_of_heap) (o9 us_rep2) (n Int))
  (find__function_guard (find o9 (get o9 n) us_HEAP3) o9 (get o9 n)
  us_HEAP3))
  (=>
  (and (get_cursor_model__function_guard o8 o7 us_HEAP2)
  (and (= (length1 o8) (length o7))
  (forall ((n Int))
  (=> (and (<= 0 n) (<= n (- (length o7) 1)))
  (= (find o8 (get o8 n) us_HEAP2) n)))))
  (let ((o9 (find o8 cu us_HEAP2)))
  (=>
  (forall ((o10 us_rep2) (o11 Int)) (get__function_guard (get o10 o11) o10
  o11))
  (=>
  (forall ((o10 us_rep2) (o11 Int)) (get__function_guard (get o10 o11) o10
  o11))
  (=>
  (forall ((o10 us_rep) (o11 us_rep2) (o12 Int)) (oeq__function_guard
  (oeq (get o11 o12) o10) (get o11 o12) o10))
  (=> (forall ((o10 us_rep2)) (length__function_guard1 (length1 o10) o10))
  (=>
  (forall ((o10 us_rep2) (m Int)) (get__function_guard (get o10 m) o10 m))
  (=>
  (forall ((o10 us_rep2) (m Int)) (get__function_guard (get o10 m) o10 m))
  (=>
  (forall ((o10 us_rep) (o11 us_rep2) (m Int)) (oeq__function_guard
  (oeq (get o11 m) o10) (get o11 m) o10))
  (=>
  (and (find__function_guard o9 o8 cu us_HEAP2)
  (and (dynamic_invariant1 o9 true false true true)
  (ite (<= 0 o9) (= (oeq (get o8 o9) cu) true)
  (forall ((m Int))
  (=> (and (<= 0 m) (<= m (- (length1 o8) 1)))
  (not (= (oeq (get o8 m) cu) true)))))))
  (forall ((us_HEAP3 us_type_of_heap) (l2__split_fields2 us_split_fields)
  (cu1 us_rep))
  (=>
  (forall ((us_HEAP4 us_type_of_heap)) (get_cursor_model__function_guard
  (get_cursor_model l1 us_HEAP4) l1 us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap)) (get_cursor_model__function_guard
  (get_cursor_model l1 us_HEAP4) l1 us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (cu2 us_rep)) (find__function_guard
  (find (get_cursor_model l1 us_HEAP4) cu2 us_HEAP4)
  (get_cursor_model l1 us_HEAP4) cu2 us_HEAP4))
  (=>
  (forall ((l2__split_fields3 us_split_fields)) (length__function_guard
  (length (us_repqtmk l2__split_fields3 l2__attr__tag))
  (us_repqtmk l2__split_fields3 l2__attr__tag)))
  (=>
  (forall ((l2__split_fields3 us_split_fields)) (length__function_guard
  (length (us_repqtmk l2__split_fields3 l2__attr__tag))
  (us_repqtmk l2__split_fields3 l2__attr__tag)))
  (=>
  (forall ((us_HEAP4 us_type_of_heap)) (get_element_model__function_guard
  (get_element_model l1 us_HEAP4) l1 us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap)) (get_element_model__function_guard
  (get_element_model l1 us_HEAP4) l1 us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (n Int)) (get__function_guard1
  (get1 (get_element_model l1 us_HEAP4) n) (get_element_model l1 us_HEAP4)
  n))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (l2__split_fields3 us_split_fields))
  (get_element_model__function_guard
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (l2__split_fields3 us_split_fields))
  (get_element_model__function_guard
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (l2__split_fields3 us_split_fields)
  (n Int)) (get__function_guard1
  (get1
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  n)
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  n))
  (=>
  (forall ((us_HEAP4 us_type_of_heap)) (get_element_model__function_guard
  (get_element_model l1 us_HEAP4) l1 us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap)) (get_element_model__function_guard
  (get_element_model l1 us_HEAP4) l1 us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (n Int)) (get__function_guard1
  (get1 (get_element_model l1 us_HEAP4) n) (get_element_model l1 us_HEAP4)
  n))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (l2__split_fields3 us_split_fields))
  (get_element_model__function_guard
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (l2__split_fields3 us_split_fields))
  (get_element_model__function_guard
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (l2__split_fields3 us_split_fields)
  (n Int)) (get__function_guard1
  (get1
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  n)
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  n))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (l2__split_fields3 us_split_fields)
  (n Int)) (is_incr__function_guard
  (is_incr (get1 (get_element_model l1 us_HEAP4) n)
  (get1
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  n)) (get1 (get_element_model l1 us_HEAP4) n)
  (get1
  (get_element_model (us_repqtmk l2__split_fields3 l2__attr__tag) us_HEAP4)
  n)))
  (=>
  (and
  (= (find (get_cursor_model l1 us_HEAP3) cu1 us_HEAP3) (length
                                                        (us_repqtmk
                                                        l2__split_fields2
                                                        l2__attr__tag)))
  (forall ((n Int))
  (=>
  (and (<= 0 n)
  (<= n (- (length (us_repqtmk l2__split_fields2 l2__attr__tag)) 1)))
  (= (is_incr (get1 (get_element_model l1 us_HEAP3) n)
     (get1
     (get_element_model (us_repqtmk l2__split_fields2 l2__attr__tag)
     us_HEAP3) n)) true))))
  (=>
  (forall ((us_HEAP4 us_type_of_heap) (cu2 us_rep))
  (has_element__function_guard (has_element l1 cu2 us_HEAP4) l1 cu2
  us_HEAP4))
  (=>
  (= (and (ite true true false) (ite (= (has_element l1 cu1 us_HEAP3) true)
                                true false)) true)
  (let ((o10 l1))
  (forall ((us_HEAP4 us_type_of_heap))
  (let ((o11 (element o10 cu1 us_HEAP4)))
  (=>
  (forall ((o12 us_rep1) (us_HEAP5 us_type_of_heap))
  (get_element_model__function_guard (get_element_model o12 us_HEAP5) o12
  us_HEAP5))
  (=>
  (forall ((o12 us_rep1) (us_HEAP5 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o12 us_HEAP5) o12
  us_HEAP5))
  (=>
  (forall ((o12 us_rep1) (us_HEAP5 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o12 us_HEAP5) o12
  us_HEAP5))
  (=>
  (forall ((cu2 us_rep) (o12 us_rep1) (us_HEAP5 us_type_of_heap))
  (find__function_guard (find (get_cursor_model o12 us_HEAP5) cu2 us_HEAP5)
  (get_cursor_model o12 us_HEAP5) cu2 us_HEAP5))
  (=>
  (forall ((o12 us_rep1) (us_HEAP5 us_type_of_heap))
  (get_element_model__function_guard (get_element_model o12 us_HEAP5) o12
  us_HEAP5))
  (=>
  (forall ((o12 us_rep1) (us_HEAP5 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o12 us_HEAP5) o12
  us_HEAP5))
  (=>
  (forall ((o12 us_rep1) (us_HEAP5 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o12 us_HEAP5) o12
  us_HEAP5))
  (=>
  (forall ((cu2 us_rep) (o12 us_rep1) (us_HEAP5 us_type_of_heap))
  (find__function_guard (find (get_cursor_model o12 us_HEAP5) cu2 us_HEAP5)
  (get_cursor_model o12 us_HEAP5) cu2 us_HEAP5))
  (=>
  (forall ((cu2 us_rep) (o12 us_rep1) (us_HEAP5 us_type_of_heap))
  (get__function_guard1
  (get1 (get_element_model o12 us_HEAP5)
  (find (get_cursor_model o12 us_HEAP5) cu2 us_HEAP5))
  (get_element_model o12 us_HEAP5)
  (find (get_cursor_model o12 us_HEAP5) cu2 us_HEAP5)))
  (=>
  (and (element__function_guard o11 o10 cu1 us_HEAP4)
  (and (dynamic_invariant3 o11 true false true true)
  (= o11 (get1 (get_element_model o10 us_HEAP4)
         (find (get_cursor_model o10 us_HEAP4) cu1 us_HEAP4)))))
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (< o11 2147483647) true false))
  (=> (= spark__branch true)
  (let ((o12 l1))
  (forall ((us_HEAP5 us_type_of_heap))
  (let ((o13 (element o12 cu1 us_HEAP5)))
  (=>
  (forall ((o14 us_rep1) (us_HEAP6 us_type_of_heap))
  (get_element_model__function_guard (get_element_model o14 us_HEAP6) o14
  us_HEAP6))
  (=>
  (forall ((o14 us_rep1) (us_HEAP6 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o14 us_HEAP6) o14
  us_HEAP6))
  (=>
  (forall ((o14 us_rep1) (us_HEAP6 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o14 us_HEAP6) o14
  us_HEAP6))
  (=>
  (forall ((cu2 us_rep) (o14 us_rep1) (us_HEAP6 us_type_of_heap))
  (find__function_guard (find (get_cursor_model o14 us_HEAP6) cu2 us_HEAP6)
  (get_cursor_model o14 us_HEAP6) cu2 us_HEAP6))
  (=>
  (forall ((o14 us_rep1) (us_HEAP6 us_type_of_heap))
  (get_element_model__function_guard (get_element_model o14 us_HEAP6) o14
  us_HEAP6))
  (=>
  (forall ((o14 us_rep1) (us_HEAP6 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o14 us_HEAP6) o14
  us_HEAP6))
  (=>
  (forall ((o14 us_rep1) (us_HEAP6 us_type_of_heap))
  (get_cursor_model__function_guard (get_cursor_model o14 us_HEAP6) o14
  us_HEAP6))
  (=>
  (forall ((cu2 us_rep) (o14 us_rep1) (us_HEAP6 us_type_of_heap))
  (find__function_guard (find (get_cursor_model o14 us_HEAP6) cu2 us_HEAP6)
  (get_cursor_model o14 us_HEAP6) cu2 us_HEAP6))
  (=>
  (forall ((cu2 us_rep) (o14 us_rep1) (us_HEAP6 us_type_of_heap))
  (get__function_guard1
  (get1 (get_element_model o14 us_HEAP6)
  (find (get_cursor_model o14 us_HEAP6) cu2 us_HEAP6))
  (get_element_model o14 us_HEAP6)
  (find (get_cursor_model o14 us_HEAP6) cu2 us_HEAP6)))
  (=>
  (and (element__function_guard o13 o12 cu1 us_HEAP5)
  (and (dynamic_invariant3 o13 true false true true)
  (= o13 (get1 (get_element_model o12 us_HEAP5)
         (find (get_cursor_model o12 us_HEAP5) cu1 us_HEAP5)))))
  (=> (in_range1 (+ o13 1))
  (let ((o14 l2__attr__tag))
  (=>
  (forall ((l2__split_fields3 us_split_fields) (o15 Int))
  (length__function_guard (length (us_repqtmk l2__split_fields3 o15))
  (us_repqtmk l2__split_fields3 o15)))
  (=>
  (forall ((l2__split_fields3 us_split_fields) (o15 Int))
  (capacity__function_guard (capacity (us_repqtmk l2__split_fields3 o15))
  (us_repqtmk l2__split_fields3 o15)))
  (<= (length (us_repqtmk l2__split_fields2 o14)) (- (capacity
                                                     (us_repqtmk
                                                     l2__split_fields2 o14)) 1))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
