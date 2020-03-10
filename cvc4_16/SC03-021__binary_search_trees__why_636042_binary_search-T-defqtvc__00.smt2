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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__binary_search__tree_acc__is_null_pointer Bool)(rec__binary_search__tree_acc__pointer_address Int)(rec__binary_search__tree_acc__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__binary_search__tree_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__binary_search__tree_acc__is_null_pointer a))

(define-fun us_rep_rec__binary_search__tree_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__binary_search__tree_acc__pointer_address a))

(define-fun us_rep_rec__binary_search__tree_acc__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__binary_search__tree_acc__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__binary_search__tree_acc__is_null_pointer a) 
                        (rec__binary_search__tree_acc__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__binary_search__tree_acc__is_null_pointer a) true))
                        (and
                        (= (rec__binary_search__tree_acc__pointer_address a) 
                        (rec__binary_search__tree_acc__pointer_address b))
                        (= (rec__binary_search__tree_acc__pointer_value_abstr
                           a) (rec__binary_search__tree_acc__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-fun m_contains (us_rep Int) Bool)

(declare-fun m_contains__function_guard (Bool us_rep Int) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((tree_acc__ref 0))
(((tree_acc__refqtmk (tree_acc__content us_rep)))))
(define-fun tree_acc__ref_tree_acc__content__projection ((a tree_acc__ref)) us_rep 
  (tree_acc__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__binary_search__tree__data integer)(rec__binary_search__tree__left us_rep)(rec__binary_search__tree__right us_rep)))))
(define-fun us_split_fields_rec__binary_search__tree__data__projection ((a us_split_fields)) integer 
  (rec__binary_search__tree__data a))

(define-fun us_split_fields_rec__binary_search__tree__left__projection ((a us_split_fields)) us_rep 
  (rec__binary_search__tree__left a))

(define-fun us_split_fields_rec__binary_search__tree__right__projection ((a us_split_fields)) us_rep 
  (rec__binary_search__tree__right a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep
                            (rec__binary_search__tree__data
                            (us_split_fields1 a))) (to_rep
                                                   (rec__binary_search__tree__data
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__binary_search__tree__left
                            (us_split_fields1 a))
                            (rec__binary_search__tree__left
                            (us_split_fields1 b))) true))
                         (= (bool_eq
                            (rec__binary_search__tree__right
                            (us_split_fields1 a))
                            (rec__binary_search__tree__right
                            (us_split_fields1 b))) true))
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

(declare-const binary_search__tree__data__first__bit Int)

(declare-const binary_search__tree__data__last__bit Int)

(declare-const binary_search__tree__data__position Int)

;; binary_search__tree__data__first__bit_axiom
  (assert (<= 0 binary_search__tree__data__first__bit))

;; binary_search__tree__data__last__bit_axiom
  (assert
  (< binary_search__tree__data__first__bit binary_search__tree__data__last__bit))

;; binary_search__tree__data__position_axiom
  (assert (<= 0 binary_search__tree__data__position))

(declare-const binary_search__tree__left__first__bit Int)

(declare-const binary_search__tree__left__last__bit Int)

(declare-const binary_search__tree__left__position Int)

;; binary_search__tree__left__first__bit_axiom
  (assert (<= 0 binary_search__tree__left__first__bit))

;; binary_search__tree__left__last__bit_axiom
  (assert
  (< binary_search__tree__left__first__bit binary_search__tree__left__last__bit))

;; binary_search__tree__left__position_axiom
  (assert (<= 0 binary_search__tree__left__position))

(declare-const binary_search__tree__right__first__bit Int)

(declare-const binary_search__tree__right__last__bit Int)

(declare-const binary_search__tree__right__position Int)

;; binary_search__tree__right__first__bit_axiom
  (assert (<= 0 binary_search__tree__right__first__bit))

;; binary_search__tree__right__last__bit_axiom
  (assert
  (< binary_search__tree__right__first__bit binary_search__tree__right__last__bit))

;; binary_search__tree__right__position_axiom
  (assert (<= 0 binary_search__tree__right__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((tree__ref 0))
(((tree__refqtmk (tree__content us_rep1)))))
(define-fun tree__ref_tree__content__projection ((a tree__ref)) us_rep1 
  (tree__content a))

(declare-fun us_open (us_main_type) us_rep1)

(declare-fun us_close (us_rep1) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep1))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__binary_search__tree_acc__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__binary_search__tree_acc__pointer_value_abstr a)))

(define-fun rec__binary_search__tree_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__binary_search__tree_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__binary_search__tree_acc__is_null_pointer us_null_pointer) true))

;; m_contains__def_axiom
  (assert
  (forall ((t us_rep))
  (forall ((v Int))
  (! (= (= (m_contains t v) true)
     (and (not (= (bool_eq t us_null_pointer) true))
     (or
     (or
     (= v (to_rep
          (rec__binary_search__tree__data
          (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))))
     (= (m_contains
        (rec__binary_search__tree__left
        (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))
        v) true))
     (= (m_contains
        (rec__binary_search__tree__right
        (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))
        v) true)))) :pattern ((m_contains t v)) ))))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq2 (us_rep2 us_rep2) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq2 (us_rep2 us_rep2) Bool)

(declare-const dummy4 us_rep2)

(declare-datatypes ((set__ref 0))
(((set__refqtmk (set__content us_rep2)))))
(define-fun set__ref_set__content__projection ((a set__ref)) us_rep2 
  (set__content a))

(declare-fun contains (us_rep2 Int) Bool)

(declare-fun contains__function_guard (Bool us_rep2 Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (element_type element_type) Bool)

(declare-const dummy5 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant ((temp___expr_238 Int)
  (temp___is_init_234 Bool) (temp___skip_constant_235 Bool)
  (temp___do_toplevel_236 Bool)
  (temp___do_typ_inv_237 Bool)) Bool (=>
                                     (or (= temp___is_init_234 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_238)))

(declare-fun oeq (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard (Bool us_rep2 us_rep2) Bool)

(declare-fun is_empty (us_rep2) Bool)

(declare-fun is_empty__function_guard (Bool us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq2 a b) (oeq a b)) :pattern ((user_eq2 a b)) )))

(define-fun default_initial_assumption ((temp___expr_246 us_rep2)
  (temp___skip_top_level_247 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_247 true))
                                         (= (is_empty temp___expr_246) true)))

;; contains__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((item Int))
  (! (=> (dynamic_invariant item true true true true)
     (=> (= (distinct 1 0) true)
     (=>
     (exists ((e Int))
     (and (and (in_range2 e) (= (contains container e) true)) (= e item)))
     (= (contains container item) true)))) :pattern ((contains container
                                                     item)) ))))

(declare-fun length (us_rep2) Int)

(declare-fun length__function_guard (Int us_rep2) Bool)

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (count_type count_type) Bool)

(declare-const dummy6 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_260 Int)
  (temp___is_init_256 Bool) (temp___skip_constant_257 Bool)
  (temp___do_toplevel_258 Bool)
  (temp___do_typ_inv_259 Bool)) Bool (=>
                                     (or (= temp___is_init_256 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_260)))

;; length__post_axiom
  (assert
  (forall ((container us_rep2)) (! (dynamic_invariant1 (length container)
  true false true true) :pattern ((length container)) )))

(declare-fun ole (us_rep2 us_rep2) Bool)

(declare-fun ole__function_guard (Bool us_rep2 us_rep2) Bool)

(declare-fun included_except (us_rep2 us_rep2 Int) Bool)

(declare-fun included_except__function_guard (Bool us_rep2 us_rep2 Int) Bool)

(declare-fun add (us_rep2 Int) us_rep2)

(declare-fun add__function_guard (us_rep2 us_rep2 Int) Bool)

;; add__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((item Int))
  (! (=>
     (and (dynamic_invariant item true true true true)
     (and (not (= (contains container item) true))
     (< (length container) 2147483647)))
     (let ((result (add container item)))
     (and
     (and
     (and (= (length result) (+ (length container) 1))
     (= (contains result item) true)) (= (ole container result) true))
     (= (included_except result container item) true)))) :pattern ((add
                                                                   container
                                                                   item)) ))))

(declare-fun included_in_union (us_rep2 us_rep2 us_rep2) Bool)

(declare-fun included_in_union__function_guard (Bool us_rep2 us_rep2
  us_rep2) Bool)

(declare-fun num_overlaps (us_rep2 us_rep2) Int)

(declare-fun num_overlaps__function_guard (Int us_rep2 us_rep2) Bool)

(declare-fun union1 (us_rep2 us_rep2) us_rep2)

(declare-fun union__function_guard (us_rep2 us_rep2 us_rep2) Bool)

;; union__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (=>
     (<= (- (length left) (num_overlaps left right)) (- 2147483647 (length
                                                                   right)))
     (let ((result (union1 left right)))
     (and
     (and
     (and
     (= (length result) (+ (- (length left) (num_overlaps left right)) 
     (length right))) (= (ole left result) true))
     (= (ole right result) true))
     (= (included_in_union result left right) true)))) :pattern ((union1 left
                                                                 right)) )))

(declare-const dummy7 us_rep)

(declare-datatypes ((t70b__ref 0))
(((t70b__refqtmk (t70b__content us_rep)))))
(define-fun t70b__ref_t70b__content__projection ((a t70b__ref)) us_rep 
  (t70b__content a))

(declare-fun size (us_rep) Int)

(declare-fun size__function_guard (Int us_rep) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (natural natural) Bool)

(declare-const dummy8 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range4
                                    temp___expr_39)))

;; size__def_axiom
  (assert
  (forall ((t us_rep))
  (! (= (size t) (ite (= (bool_eq t us_null_pointer) true) 0
                 (ite (< (size
                         (rec__binary_search__tree__left
                         (us_split_fields1
                         (rec__binary_search__tree_acc__pointer_value t)))) (- 2147483647 
                 (size
                 (rec__binary_search__tree__right
                 (us_split_fields1
                 (rec__binary_search__tree_acc__pointer_value t))))))
                 (+ (+ (size
                       (rec__binary_search__tree__left
                       (us_split_fields1
                       (rec__binary_search__tree_acc__pointer_value t)))) 
                 (size
                 (rec__binary_search__tree__right
                 (us_split_fields1
                 (rec__binary_search__tree_acc__pointer_value t))))) 1)
                 2147483647))) :pattern ((size t)) )))

(declare-const dummy9 us_rep)

(declare-datatypes ((t71b__ref 0))
(((t71b__refqtmk (t71b__content us_rep)))))
(define-fun t71b__ref_t71b__content__projection ((a t71b__ref)) us_rep 
  (t71b__content a))

(declare-const t us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq6 (us_rep2 us_rep2) Bool)

(declare-const dummy10 us_rep2)

(declare-datatypes ((int_set__ref 0))
(((int_set__refqtmk (int_set__content us_rep2)))))
(define-fun int_set__ref_int_set__content__projection ((a int_set__ref)) us_rep2 
  (int_set__content a))

(declare-fun all_v (us_rep) us_rep2)

(declare-fun all_v__function_guard (us_rep2 us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq6 a b) (oeq a b)) :pattern ((user_eq6 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_268 us_rep2)
  (temp___skip_top_level_269 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_269 true))
                                         (= (is_empty temp___expr_268) true)))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun default_initial_assumption2 ((temp___expr_212 us_rep)
  (temp___skip_top_level_213 Bool)) Bool (= (rec__binary_search__tree_acc__is_null_pointer
                                            temp___expr_212) true))

(define-fun default_initial_assumption3 ((temp___expr_219 us_rep1)
  (temp___skip_top_level_220 Bool)) Bool (and
                                         (= (rec__binary_search__tree_acc__is_null_pointer
                                            (rec__binary_search__tree__left
                                            (us_split_fields1
                                            temp___expr_219))) true)
                                         (= (rec__binary_search__tree_acc__is_null_pointer
                                            (rec__binary_search__tree__right
                                            (us_split_fields1
                                            temp___expr_219))) true)))

;; m_contains__post_axiom
  (assert true)

;; size__post_axiom
  (assert
  (forall ((t1 us_rep)) (! (dynamic_invariant2 (size t1) true false true
  true) :pattern ((size t1)) )))

;; ole__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (= (= (ole left right) true)
     (forall ((item Int))
     (=> (and (in_range2 item) (= (contains left item) true))
     (= (contains right item) true)))) :pattern ((ole left right)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (= (= (oeq left right) true)
     (and (= (ole left right) true) (= (ole right left) true))) :pattern (
  (oeq left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (let ((result (is_empty container)))
     (and
     (= (= result true)
     (forall ((item Int))
     (not (and (in_range2 item) (= (contains container item) true)))))
     (= (= result true) (= (length container) 0)))) :pattern ((is_empty
                                                              container)) )))

;; included_except__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (forall ((item Int))
  (! (=> (dynamic_invariant item true true true true)
     (= (= (included_except left right item) true)
     (forall ((e Int))
     (=> (and (in_range2 e) (= (contains left e) true))
     (or (= (contains right e) true) (= e item)))))) :pattern ((included_except
                                                               left right
                                                               item)) ))))

(declare-fun includes_intersection (us_rep2 us_rep2 us_rep2) Bool)

(declare-fun includes_intersection__function_guard (Bool us_rep2 us_rep2
  us_rep2) Bool)

;; includes_intersection__post_axiom
  (assert
  (forall ((container us_rep2) (left us_rep2) (right us_rep2))
  (! (= (= (includes_intersection container left right) true)
     (forall ((item Int))
     (=> (and (in_range2 item) (= (contains left item) true))
     (=> (= (contains right item) true) (= (contains container item) true))))) :pattern (
  (includes_intersection container left right)) )))

;; included_in_union__post_axiom
  (assert
  (forall ((container us_rep2) (left us_rep2) (right us_rep2))
  (! (= (= (included_in_union container left right) true)
     (forall ((item Int))
     (=> (and (in_range2 item) (= (contains container item) true))
     (or (= (contains left item) true) (= (contains right item) true))))) :pattern (
  (included_in_union container left right)) )))

(declare-fun no_overlap (us_rep2 us_rep2) Bool)

(declare-fun no_overlap__function_guard (Bool us_rep2 us_rep2) Bool)

;; no_overlap__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (= (= (no_overlap left right) true)
     (forall ((item Int))
     (=> (and (in_range2 item) (= (contains left item) true))
     (not (= (contains right item) true))))) :pattern ((no_overlap left
                                                       right)) )))

(declare-fun intersection1 (us_rep2 us_rep2) us_rep2)

(declare-fun intersection__function_guard (us_rep2 us_rep2 us_rep2) Bool)

;; num_overlaps__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (let ((result (num_overlaps left right)))
     (and
     (and
     (and
     (and (= result (length (intersection1 left right)))
     (ite (= (ole left right) true) (= result (length left))
     (< result (length left))))
     (ite (= (ole right left) true) (= result (length right))
     (< result (length right))))
     (= (= result 0) (= (no_overlap left right) true))) (dynamic_invariant1
     result true false true true))) :pattern ((num_overlaps left right)) )))

;; intersection__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (let ((result (intersection1 left right)))
     (and (and (= (ole result left) true) (= (ole result right) true))
     (= (includes_intersection result left right) true))) :pattern ((intersection1
                                                                    left
                                                                    right)) )))

(assert
;; defqtvc
 ;; File "binary_search.adb", line 127, characters 0-0
  (not
  (forall ((s us_rep2) (spark__branch Bool))
  (=> (< (size t) 2147483647)
  (=> (default_initial_assumption1 s false)
  (=> (= spark__branch (bool_eq t us_null_pointer))
  (=> (not (= spark__branch true))
  (let ((o (rec__binary_search__tree__right
           (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))))
  (let ((o1 (all_v o)))
  (=>
  (and (<= (length o1) (size o))
  (forall ((i Int))
  (=> (and (<= (- 2147483648) i) (<= i 2147483647))
  (= (= (m_contains o i) true) (= (contains o1 i) true)))))
  (let ((o2 (rec__binary_search__tree__left
            (us_split_fields1
            (rec__binary_search__tree_acc__pointer_value t)))))
  (let ((o3 (all_v o2)))
  (=>
  (and (<= (length o3) (size o2))
  (forall ((i Int))
  (=> (and (<= (- 2147483648) i) (<= i 2147483647))
  (= (= (m_contains o2 i) true) (= (contains o3 i) true)))))
  (let ((o4 (union1 o3 o1)))
  (=>
  (and
  (and
  (and (= (length o4) (+ (- (length o3) (num_overlaps o3 o1)) (length o1)))
  (= (ole o3 o4) true)) (= (ole o1 o4) true))
  (= (included_in_union o4 o3 o1) true))
  (forall ((s1 us_rep2))
  (=> (= s1 o4)
  (forall ((o5 Int))
  (=>
  (= (to_rep
     (rec__binary_search__tree__data
     (us_split_fields1 (rec__binary_search__tree_acc__pointer_value t)))) o5)
  (let ((o6 (contains s1 o5)))
  (=>
  (=> (= (distinct 1 0) true)
  (=>
  (exists ((e Int))
  (and (and (in_range2 e) (= (contains s1 e) true)) (= e o5))) (= o6 true)))
  (forall ((spark__branch1 Bool))
  (=> (= spark__branch1 (ite (= o6 true) false true))
  (=> (= spark__branch1 true)
  (rec__binary_search__tree_acc__pointer_value__pred t)))))))))))))))))))))))))
(check-sat)
(exit)
