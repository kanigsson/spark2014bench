;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(declare-sort character 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (character character) Bool)

(declare-const dummy character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(define-fun dynamic_invariant ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range temp___expr_74)))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-fun valid (Int) Bool)

(declare-fun valid__function_guard (Bool Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun valid_state ((Array Int character) Int Int) Bool)

(declare-fun valid_state__function_guard (Bool (Array Int character) Int
  Int) Bool)

;; valid_state__def_axiom
  (assert
  (forall ((buf_read__buffer (Array Int character)))
  (forall ((buf_read__pointer Int) (buf_read__max_read Int))
  (! (and
     (forall ((buf_read__buffer1 (Array Int character)) (index Int))
     (valid__function_guard (valid (to_rep (select buf_read__buffer1 index)))
     (to_rep (select buf_read__buffer1 index))))
     (=
     (= (valid_state buf_read__buffer buf_read__pointer buf_read__max_read) true)
     (and (<= buf_read__pointer buf_read__max_read)
     (forall ((index Int))
     (=> (and (<= 1 index) (<= index buf_read__max_read))
     (= (valid (to_rep (select buf_read__buffer index))) true)))))) :pattern (
  (valid_state buf_read__buffer buf_read__pointer buf_read__max_read)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort tindex_typeB 0)

(declare-fun tindex_typeBqtint (tindex_typeB) Int)

;; tindex_typeB'axiom
  (assert
  (forall ((i tindex_typeB))
  (and (<= (- 2147483648) (tindex_typeBqtint i))
  (<= (tindex_typeBqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tindex_typeB tindex_typeB) Bool)

(declare-const dummy1 tindex_typeB)

(declare-datatypes ()
((tindex_typeB__ref
 (tindex_typeB__refqtmk (tindex_typeB__content tindex_typeB)))))
(define-fun tindex_typeB__ref_tindex_typeB__content__projection ((a tindex_typeB__ref)) tindex_typeB 
  (tindex_typeB__content a))

(define-fun to_rep1 ((x tindex_typeB)) Int (tindex_typeBqtint x))

(declare-fun of_rep1 (Int) tindex_typeB)

;; inversion_axiom
  (assert
  (forall ((x tindex_typeB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tindex_typeB)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= (- 2147483648) (index_typeqtint i))
  (<= (index_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (index_type index_type) Bool)

(declare-const dummy2 index_type)

(declare-datatypes ()
((index_type__ref (index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_160)))

(declare-sort real_index_type 0)

(declare-fun real_index_typeqtint (real_index_type) Int)

;; real_index_type'axiom
  (assert
  (forall ((i real_index_type))
  (and (<= 1 (real_index_typeqtint i)) (<= (real_index_typeqtint i) 1000))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (real_index_type real_index_type) Bool)

(declare-const dummy3 real_index_type)

(declare-datatypes ()
((real_index_type__ref
 (real_index_type__refqtmk (real_index_type__content real_index_type)))))
(define-fun real_index_type__ref_real_index_type__content__projection ((a real_index_type__ref)) real_index_type 
  (real_index_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 1 1000)) (in_range3
                                     temp___expr_167)))

(declare-sort t 0)

(declare-fun first (t) tindex_typeB)

(declare-fun last (t) tindex_typeB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((buffer_type__ref (buffer_type__refqtmk (buffer_type__content us_t)))))
(define-fun buffer_type__ref_buffer_type__content__projection ((a buffer_type__ref)) us_t 
  (buffer_type__content a))

(define-fun dynamic_invariant3 ((temp___expr_174 us_t)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (not (= temp___skip_constant_171 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_174)
                                     (last1 temp___expr_174))))

(declare-const pointer Int)

(declare-const max_read Int)

(declare-const buffer (Array Int character))

(declare-const c Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 pointer true false true true))

;; Assume
  (assert (dynamic_invariant2 max_read true false true true))

;; Assume
  (assert (dynamic_invariant c false false true true))

;; H
  (assert
  (forall ((pointer1 Int) (max_read1 Int) (buffer1 (Array Int character)))
  (valid_state__function_guard (valid_state buffer1 pointer1 max_read1)
  buffer1 pointer1 max_read1)))

;; Assume
  (assert (= (valid_state buffer pointer max_read) true))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep (select buffer pointer)) o))

(declare-const c1 Int)

;; H
  (assert (= c1 o))

(declare-const pointer1 Int)

(declare-const max_read1 Int)

(declare-const buffer1 (Array Int character))

;; H
  (assert
  (forall ((buf_read__read__b (Array Int character)) (index Int))
  (valid__function_guard (valid (to_rep (select buf_read__read__b index)))
  (to_rep (select buf_read__read__b index)))))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= pointer max_read) true false)))

(declare-const o1 tindex_typeB)

(declare-const o2 tindex_typeB)

(declare-const buf_read__read__count Int)

(declare-const buf_read__read__b (Array Int character))

;; H
  (assert
  (ite (= spark__branch true)
  (and (= (to_rep1 o1) 1000)
  (and (= (to_rep1 o2) 1)
  (and
  (and
  (and
  (and (<= (to_rep1 o2) buf_read__read__count)
  (<= buf_read__read__count (to_rep1 o1)))
  (forall ((index Int))
  (=>
  (and (<= (to_rep1 o2) index)
  (<= index (- (+ (to_rep1 o2) buf_read__read__count) 1)))
  (= (valid (to_rep (select buf_read__read__b index))) true))))
  (dynamic_invariant1 buf_read__read__count true true true true))
  (let ((temp___198 (of_array buf_read__read__b 1 1000)))
  (and (= buffer1 (slide (to_array temp___198) (first1 temp___198) 1))
  (and (in_range3 buf_read__read__count)
  (and (= max_read1 buf_read__read__count) (= pointer1 1))))))))
  (and
  (and (let ((o3 (+ pointer 1))) (and (in_range3 o3) (= pointer1 o3)))
  (= max_read1 max_read)) (= buffer1 buffer))))

;; H
  (assert (forall ((c2 Int)) (valid__function_guard (valid c2) c2)))

(assert
;; defqtvc
 ;; File "buf_read.ads", line 7, characters 0-0
  (not (= (valid c1) true)))
(check-sat)