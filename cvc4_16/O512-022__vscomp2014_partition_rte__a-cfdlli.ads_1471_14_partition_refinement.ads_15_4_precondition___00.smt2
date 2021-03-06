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

(declare-fun user_eq (count_type count_type) Bool)

(declare-const dummy count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun to_rep ((x count_type)) Int (count_typeqtint x))

(declare-fun of_rep (Int) count_type)

;; inversion_axiom
  (assert
  (forall ((x count_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x count_type)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__partition_refinement__partitioning_sets__cursor__node count_type)))))
(define-fun us_split_fields_rec__partition_refinement__partitioning_sets__cursor__node__projection ((a us_split_fields)) count_type 
  (rec__partition_refinement__partitioning_sets__cursor__node a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__partition_refinement__partitioning_sets__cursor__node
                           (us_split_fields1 a))) (to_rep
                                                  (rec__partition_refinement__partitioning_sets__cursor__node
                                                  (us_split_fields1 b))))
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

(declare-const partition_refinement__partitioning_sets__cursor__node__first__bit Int)

(declare-const partition_refinement__partitioning_sets__cursor__node__last__bit Int)

(declare-const partition_refinement__partitioning_sets__cursor__node__position Int)

;; partition_refinement__partitioning_sets__cursor__node__first__bit_axiom
  (assert
  (<= 0 partition_refinement__partitioning_sets__cursor__node__first__bit))

;; partition_refinement__partitioning_sets__cursor__node__last__bit_axiom
  (assert
  (< partition_refinement__partitioning_sets__cursor__node__first__bit 
  partition_refinement__partitioning_sets__cursor__node__last__bit))

;; partition_refinement__partitioning_sets__cursor__node__position_axiom
  (assert
  (<= 0 partition_refinement__partitioning_sets__cursor__node__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-const no_element us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__partition_refinement__partitioning_sets__list__capacity count_type)))))
(define-fun us_split_discrs_rec__partition_refinement__partitioning_sets__list__capacity__projection ((a us_split_discrs)) count_type 
  (rec__partition_refinement__partitioning_sets__list__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__partition_refinement__partitioning_sets__list us_main_type)))))
(define-fun us_split_fields_rec__partition_refinement__partitioning_sets__list__projection ((a us_split_fields2)) us_main_type 
  (rec__partition_refinement__partitioning_sets__list a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__partition_refinement__partitioning_sets__list__capacity
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__partition_refinement__partitioning_sets__list__capacity
                                                   (us_split_discrs1 b))))
                         (= (us_main_eq
                            (rec__partition_refinement__partitioning_sets__list
                            (us_split_fields3 a))
                            (rec__partition_refinement__partitioning_sets__list
                            (us_split_fields3 b))) true))
                    true false))

(define-fun in_range2 ((rec__partition_refinement__partitioning_sets__list__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__partition_refinement__partitioning_sets__list__capacity1 
  (to_rep (rec__partition_refinement__partitioning_sets__list__capacity a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const partition_refinement__partitioning_sets__list__capacity__first__bit Int)

(declare-const partition_refinement__partitioning_sets__list__capacity__last__bit Int)

(declare-const partition_refinement__partitioning_sets__list__capacity__position Int)

;; partition_refinement__partitioning_sets__list__capacity__first__bit_axiom
  (assert
  (<= 0 partition_refinement__partitioning_sets__list__capacity__first__bit))

;; partition_refinement__partitioning_sets__list__capacity__last__bit_axiom
  (assert
  (< partition_refinement__partitioning_sets__list__capacity__first__bit 
  partition_refinement__partitioning_sets__list__capacity__last__bit))

;; partition_refinement__partitioning_sets__list__capacity__position_axiom
  (assert
  (<= 0 partition_refinement__partitioning_sets__list__capacity__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep1)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep1 
  (list__content a))

(declare-fun length (us_rep1) Int)

(declare-fun length__function_guard (Int us_rep1) Bool)

(declare-fun oeq (us_rep1 us_rep1) Bool)

(declare-fun oeq__function_guard (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq2 a b) (oeq a b)) :pattern ((user_eq2 a b)) )))

(define-fun dynamic_invariant ((temp___expr_447 Int)
  (temp___is_init_443 Bool) (temp___skip_constant_444 Bool)
  (temp___do_toplevel_445 Bool)
  (temp___do_typ_inv_446 Bool)) Bool (=>
                                     (or (= temp___is_init_443 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_447)))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length container)))
     (and
     (<= result (to_rep
                (rec__partition_refinement__partitioning_sets__list__capacity
                (us_split_discrs1 container))))
     (dynamic_invariant result true false true true))) :pattern ((length
                                                                 container)) )))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq2 (us_rep2 us_rep2) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep2)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep2 
  (sequence__content a))

(declare-fun get (us_rep2 Int) Int)

(declare-fun get__function_guard (Int us_rep2 Int) Bool)

(define-fun contains ((container us_rep2) (fst Int) (lst Int)
  (item Int)) Bool (ite (exists ((i Int))
                        (and (and (<= fst i) (<= i lst))
                        (= (get container i) item)))
                   true false))

(declare-fun contains__function_guard (Bool us_rep2 Int Int Int) Bool)

(declare-fun length1 (us_rep2) Int)

(declare-fun length__function_guard1 (Int us_rep2) Bool)

(define-fun last ((container us_rep2)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep2) Bool)

(declare-sort us_main_type2 0)

(declare-fun us_main_eq2 (us_main_type2 us_main_type2) Bool)

(declare-sort us_rep3 0)

(declare-fun bool_eq3 (us_rep3 us_rep3) Bool)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq4 (us_rep3 us_rep3) Bool)

(declare-const dummy4 us_rep3)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content us_rep3)))))
(define-fun map__ref_map__content__projection ((a map__ref)) us_rep3 
  (map__content a))

(declare-datatypes ((key_type__ref 0))
(((key_type__refqtmk (key_type__content us_rep)))))
(define-fun key_type__ref_key_type__content__projection ((a key_type__ref)) us_rep 
  (key_type__content a))

(declare-fun get1 (us_rep3 us_rep) Int)

(declare-fun get__function_guard1 (Int us_rep3 us_rep) Bool)

(declare-fun has_key (us_rep3 us_rep) Bool)

(declare-fun has_key__function_guard (Bool us_rep3 us_rep) Bool)

(declare-fun witness (us_rep3 us_rep) Int)

(declare-fun witness__function_guard (Int us_rep3 us_rep) Bool)

(declare-fun w_get (us_rep3 Int) Int)

(declare-fun w_get__function_guard (Int us_rep3 Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 1 (element_typeqtint i)) (<= (element_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq5 (element_type element_type) Bool)

(declare-const dummy5 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_512 Int)
  (temp___is_init_508 Bool) (temp___skip_constant_509 Bool)
  (temp___do_toplevel_510 Bool)
  (temp___do_typ_inv_511 Bool)) Bool (=>
                                     (or (= temp___is_init_508 true)
                                     (<= 1 2147483647)) (in_range3
                                     temp___expr_512)))

(declare-fun length2 (us_rep3) Int)

(declare-fun length__function_guard2 (Int us_rep3) Bool)

(declare-fun oeq1 (us_rep3 us_rep3) Bool)

(declare-fun oeq__function_guard1 (Bool us_rep3 us_rep3) Bool)

(declare-fun is_empty (us_rep3) Bool)

(declare-fun is_empty__function_guard (Bool us_rep3) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep3) (b us_rep3))
  (! (= (user_eq4 a b) (oeq1 a b)) :pattern ((user_eq4 a b)) )))

(define-fun default_initial_assumption ((temp___expr_520 us_rep3)
  (temp___skip_top_level_521 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_521 true))
                                         (and
                                         (= (is_empty temp___expr_520) true)
                                         (= (length2 temp___expr_520) 0))))

(define-fun default_initial_assumption1 ((temp___expr_506 us_rep)
  (temp___skip_top_level_507 Bool)) Bool (= (to_rep
                                            (rec__partition_refinement__partitioning_sets__cursor__node
                                            (us_split_fields1
                                            temp___expr_506))) 0))

;; get__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((key us_rep))
  (! (=> (= (has_key container key) true)
     (let ((result (get1 container key)))
     (and
     (=> (= (distinct 0 0) true)
     (and (= result (w_get container (witness container key)))
     (forall ((k us_rep))
     (=> (= (has_key container k) true)
     (= (= (bool_eq k key) true)
     (= (witness container key) (witness container k)))))))
     (dynamic_invariant1 result true false true true)))) :pattern ((get1
                                                                   container
                                                                   key)) ))))

(declare-fun model1 (us_rep1) us_rep2)

(declare-fun model__function_guard (us_rep2 us_rep1) Bool)

(define-fun length3 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun oeq2 ((left us_rep2)
  (right us_rep2)) Bool (and (= (length1 left) (length1 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (get left
                                                                   n) 
                                                                (get right n))))
                                                                true false)))

(declare-fun oeq__function_guard2 (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq3 a b) (oeq2 a b)) :pattern ((user_eq3 a b)) )))

(define-fun default_initial_assumption2 ((temp___expr_498 us_rep2)
  (temp___skip_top_level_499 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_499 true))
                                         (= (length1 temp___expr_498) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (= (length1 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

(declare-fun positions (us_rep1) us_rep3)

(declare-fun positions__function_guard (us_rep3 us_rep1) Bool)

;; positions__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (positions container)))
     (and (not (= (has_key result no_element) true))
     (forall ((i us_rep))
     (=> (= (has_key result i) true)
     (and
     (let ((temp___572 (get1 result i)))
     (and (<= 1 temp___572) (<= temp___572 (length container))))
     (forall ((j us_rep))
     (=> (= (has_key result j) true)
     (=> (= (get1 result i) (get1 result j)) (= (bool_eq i j) true))))))))) :pattern (
  (positions container)) )))

(define-fun has_element ((container us_rep1)
  (position us_rep)) Bool (has_key (positions container) position))

(declare-fun has_element__function_guard (Bool us_rep1 us_rep) Bool)

(define-fun default_initial_assumption3 ((temp___expr_461 us_rep)
  (temp___skip_top_level_462 Bool)) Bool (= (to_rep
                                            (rec__partition_refinement__partitioning_sets__cursor__node
                                            (us_split_fields1
                                            temp___expr_461))) 0))

(declare-const container us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const item Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const position us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 1 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq6 (element_type1 element_type1) Bool)

(declare-const dummy6 element_type1)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant2 ((temp___expr_440 Int)
  (temp___is_init_436 Bool) (temp___skip_constant_437 Bool)
  (temp___do_toplevel_438 Bool)
  (temp___do_typ_inv_439 Bool)) Bool (=>
                                     (or (= temp___is_init_436 true)
                                     (<= 1 2147483647)) (in_range4
                                     temp___expr_440)))

(declare-const rliteral count_type)

;; rliteral_axiom
  (assert (= (count_typeqtint rliteral) 0))

;; no_element__def_axiom
  (assert (= no_element (us_repqtmk (us_split_fieldsqtmk rliteral))))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep1) (right us_rep1))
  (! (= (= (oeq left right) true)
     (= (oeq2 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (extended_index extended_index) Bool)

(declare-const dummy7 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant3 ((temp___expr_490 Int)
  (temp___is_init_486 Bool) (temp___skip_constant_487 Bool)
  (temp___do_toplevel_488 Bool)
  (temp___do_typ_inv_489 Bool)) Bool (=>
                                     (or (= temp___is_init_486 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_490)))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (! (let ((result (length1 container1)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant result true false
     true true))) :pattern ((length1 container1)) )))

(declare-sort element_type2 0)

(declare-fun element_typeqtint2 (element_type2) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type2))
  (and (<= 1 (element_typeqtint2 i)) (<= (element_typeqtint2 i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq8 (element_type2 element_type2) Bool)

(declare-const dummy8 element_type2)

(declare-datatypes ((element_type__ref2 0))
(((element_type__refqtmk2 (element_type__content2 element_type2)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref2)) element_type2 
  (element_type__content2 a))

(define-fun dynamic_invariant4 ((temp___expr_483 Int)
  (temp___is_init_479 Bool) (temp___skip_constant_480 Bool)
  (temp___do_toplevel_481 Bool)
  (temp___do_typ_inv_482 Bool)) Bool (=>
                                     (or (= temp___is_init_479 true)
                                     (<= 1 2147483647)) (in_range6
                                     temp___expr_483)))

;; get__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (forall ((position1 Int))
  (! (=>
     (and (dynamic_invariant3 position1 true true true true)
     (and (<= 1 position1) (<= position1 (last container1))))
     (dynamic_invariant4 (get container1 position1) true false true true)) :pattern (
  (get container1 position1)) ))))

;; has_key__post_axiom
  (assert
  (forall ((container1 us_rep3))
  (forall ((key us_rep))
  (! (=> (= (distinct 0 0) true)
     (=>
     (exists ((k us_rep))
     (and (= (has_key container1 k) true) (= (bool_eq k key) true)))
     (= (has_key container1 key) true))) :pattern ((has_key container1 key)) ))))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep3)) (! (dynamic_invariant (length2 container1)
  true false true true) :pattern ((length2 container1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep3) (right us_rep3))
  (! (= (= (oeq1 left right) true)
     (and
     (forall ((key us_rep))
     (=> (= (has_key left key) true)
     (and (= (has_key right key) true) (= (get1 right key) (get1 left key)))))
     (forall ((key us_rep))
     (=> (= (has_key right key) true) (= (has_key left key) true))))) :pattern (
  (oeq1 left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container1 us_rep3))
  (! (= (= (is_empty container1) true)
     (forall ((key us_rep)) (not (= (has_key container1 key) true)))) :pattern (
  (is_empty container1)) )))

(declare-fun has_witness (us_rep3 Int) Bool)

(declare-fun has_witness__function_guard (Bool us_rep3 Int) Bool)

;; has_witness__post_axiom
  (assert true)

;; witness__post_axiom
  (assert
  (forall ((container1 us_rep3))
  (forall ((key us_rep))
  (! (=> (= (has_key container1 key) true)
     (let ((result (witness container1 key)))
     (and (= (has_witness container1 result) true) (dynamic_invariant result
     true false true true)))) :pattern ((witness container1 key)) ))))

;; w_get__post_axiom
  (assert
  (forall ((container1 us_rep3))
  (forall ((witness1 Int))
  (! (=>
     (and (dynamic_invariant witness1 true true true true)
     (= (has_witness container1 witness1) true)) (dynamic_invariant1
     (w_get container1 witness1) true false true true)) :pattern ((w_get
                                                                  container1
                                                                  witness1)) ))))

(assert
;; defqtvc
 ;; File "a-cfdlli.ads", line 1458, characters 0-0
  (not
  (forall ((o Int))
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral)) no_element)
  (=> (dynamic_invariant2 item true false true true)
  (=>
  (or (= (has_element container position) true)
  (= (bool_eq position no_element) true))
  (=>
  (ite (= (bool_eq position no_element) true)
  (let ((o1 container))
  (and (= o (length o1))
  (and (dynamic_invariant o true false true true)
  (<= o (to_rep
        (rec__partition_refinement__partitioning_sets__list__capacity
        (us_split_discrs1 o1)))))))
  (let ((o1 position))
  (let ((o2 container))
  (let ((o3 (positions o2)))
  (and
  (and (not (= (has_key o3 no_element) true))
  (forall ((i us_rep))
  (=> (= (has_key o3 i) true)
  (and
  (let ((temp___568 (get1 o3 i)))
  (and (<= 1 temp___568) (<= temp___568 (length o2))))
  (forall ((j us_rep))
  (=> (= (has_key o3 j) true)
  (=> (= (get1 o3 i) (get1 o3 j)) (= (bool_eq i j) true))))))))
  (and (= o (get1 o3 o1))
  (and (dynamic_invariant1 o true false true true)
  (=> (= (distinct 0 0) true)
  (and (= o (w_get o3 (witness o3 o1)))
  (forall ((k us_rep))
  (=> (= (has_key o3 k) true)
  (= (= (bool_eq k o1) true) (= (witness o3 o1) (witness o3 k))))))))))))))
  (let ((o1 container))
  (let ((o2 (model1 o1))) (=> (= (length1 o2) (length o1)) (<= o (last o2))))))))))))
(check-sat)
(exit)
